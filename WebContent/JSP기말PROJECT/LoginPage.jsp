<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin </title>

    
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="signin.css" rel="stylesheet">
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
  </head>
  <style>
  
 body {
    	background-image:url('images/운동장.jpg');
    	background-size:cover;
    }
    
  #apple {
	font-size:350% ;
	color:#fefffe;
	
		}
    </style>
  <body>
    <div class="container">

      <form class="form-signin" action="LoginCheck.jsp" method="post"><p> <!-- 로그인 체크 로 넘어감 -->
        <h2 id = "apple" class="form-signin-heading">Please sign in</h2>
        <hr>
        <label for="inputEmail" class="sr-only">Email address</label><p>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="checkEmail" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="checkPWD" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me 
            
          </label>
        </div>
        <hr>
        <button class="btn btn-lg btn-primary btn-block "  type="submit">로그인</button><br>
        <button class="btn btn-lg btn-primary btn-block " onClick="location.href ='join.jsp'" type="submit">회원 가입</button>
      </form>

    </div> 

  </body>
</html>