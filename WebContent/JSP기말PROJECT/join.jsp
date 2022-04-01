<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원가입</title>
        
        <script
  src="https://code.jquery.com/jquery-3.4.0.slim.js"
  integrity="sha256-milezx5lakrZu0OP9b2QWFy1ft/UEUK6NH1Jqz8hUhQ="
  crossorigin="anonymous"></script>
  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="../plugin/bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        
        <script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
        <script src="../config/js/join.js"></script>
    </head>
    <style>
    body {
    	background-image:url('images/모델.jpg');
    	background-size:cover;
    }
    
    h3 {
	font-size:250% ;
	color:#fffffe;
		}
	p,a {
	font-size:120% ;
	color:#fffffe;
	}
    </style>
    <body>
   

        <article class="container">
            <div class="page-header">
             <a href="Home.jsp">  <h1>I Love Soccer</h1></a> 
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입 Form</h3><p>
                </div>
            </div>
           
            <div class="col-sm-6 col-md-offset-3">
               <form action="joinOK.jsp" method="post">
                    <div class="form-group">
                        <p>성명</p>
                        <input type="text" class="form-control" id="inputName" placeholder="이름을 입력해 주세요" name="inputName">
                    </div>
                    <div class="form-group">
                      <p>  이메일 주소</p>
                        <input type="email" class="form-control" id="inputEmail" placeholder="이메일 주소를 입력해주세요" name="inputEmail" >
                    </div>
                    <div class="form-group">
                      	<p> 비밀번호</p>
                        <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력해주세요" name="inputPassword">
                    </div>
										<div class="form-group">
                   <p>  휴대폰 번호</p>
                        <input type="tel" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요" name="inputMobile">
                    </div>
                    
							<p>
                    <div class="form-group">
                    <p>약관 동의</p>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" checked>
                    </label>
                    <a href="#">이용약관 에 동의합니다.</a>
                    </div>
                    </div>


                    <div class="form-group text-center">
                    
														<input type="submit" value="입력완료">
														<input type="reset" value="다시입력">
                    </div>
                </form>
            </div>

        </article>
        
    </body>
</html>

