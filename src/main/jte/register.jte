@import com.example.demo.dto.UserDto

@param UserDto user

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h2>Register User</h2>
<form method="post" action="/register">

    <label>Username:</label><br/>
    <input type="text" name="username"/><br/>

    <label>Password:</label><br/>
    <input type="password" name="password"/><br/>

    <label>Role:</label><br/>
    <input type="text" name="role"/><br/><br/>

    <input type="submit" value="Register"/>
</form>

</body>
</html>
