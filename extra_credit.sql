ALTER TABLE youth
ADD COLUMN password_hash text;

CREATE OR REPLACE FUNCTION
signup(name text, youth_email text, password text) RETURNS VOID
AS $$
  INSERT INTO youth (name, youth_email, password_hash) VALUES
    (signup.name, signup.youth_email, crypt(signup.password, gen_salt('bf', 8)));
$$ LANGUAGE sql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION
login(email TEXT, password TEXT) RETURNS jwt_token
  LANGUAGE plpgsql SECURITY DEFINER
  AS $$
DECLARE
  _role NAME;
  result jwt_token;
BEGIN
  SELECT youth.youth_email FROM youth WHERE youth.youth_email=login.email AND youth.password_hash=crypt(login.password, youth.password_hash) INTO _role;
  IF _role IS NULL THENc
    RAISE invalid_password USING message = 'invalid user or password';
  END IF;

  SELECT sign(
      row_to_json(r), current_setting('app.settings.jwt_secret')
    ) AS token
    from (
      SELECT 'admins' AS role, login.email AS email, _role AS user_id,
         extract(epoch from now())::integer + 3600*60*60 as exp
    ) r
    INTO result;

  RETURN result;
END;
$$;
