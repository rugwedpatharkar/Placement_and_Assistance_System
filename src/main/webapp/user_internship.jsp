<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%
 if(session.getAttribute("u_name")==null){
	 response.sendRedirect("user_signin.jsp");
 }%>
 
<!DOCTYPE html>
<html lang="en">
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement and Assistance System</title>
    <link rel = "icon" href = "images/logo1.png" type = "image/x-icon">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script type='text/javascript'src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
    <input type="hidden" id="status"value="<%= request.getAttribute("status") %>">

  <nav class="navbar">
    <div class="content">
    <a href="user_section.jsp"style="text-decoration:none;">  <div class="logo">Placement and Assistance System</div></a>
      <ul class="menu-list">
        <div class="icon cancel-btn">
          <i class="fas fa-times"></i>
        </div>
    
     
                                        <div class="logo" style="font-size:20px;margin-right:30px"><%=session.getAttribute("u_name") %></div>
          <a href="UserLogoutServlet" class="button-two"style="background-color:rgb(164, 10, 10);text-decoration:none;padding:5px 15px 5px 15px;width:100px"type="submit"  >LOG OUT</a>
      
   
    
      </ul>
      <div class="icon menu-btn">
        <i class="fas fa-bars"></i>
      </div>
    </div>
  </nav>
  
  <div class="banner"></div>


<section class="signup"style="width:100%">
			<div class="container"style="width:100%;padding:0 0 0 0;">
				<div class="signup-content"style="width:100%;padding:20px 0 0 0;">
					<div class="signup-form"style="width:50%;padding:0 0 0 0">
					
<aside>
 <div class="rcorners2"> 
  <nav>
    <ul>
    <form action="UserListServlet" method="post"><input type="hidden" id="uid" name="uid" value="<%=session.getAttribute("uid") %>"><button type="submit"class="profilebtn"><li>User Profile</li></button></form>
    <a href="user_edu_register.jsp"style="text-decoration:none;"><li>Add Educational Details</li></a>
    <a href="UserCompListServlet"style="text-decoration:none;"><li>Available Internships</li></a>
    <a href="#"style="text-decoration:none;"><li>Available Jobs</li></a>
    <a href="#"style="text-decoration:none;"><li>Applies</li></a>
    <a href="user_del_profile.jsp"style="text-decoration:none;"><li>Delete Profile</li></a>
    </ul>
  </nav>
 </div> 
</aside>

</div>
<div class="signup-image" >
					<div class="rcorners3"> 

						 <div class="container"style="overflow-y: auto;">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    
						<h2 class="title1">Internship section</h2>
				
						<a href="UserInternListServlet" class="button-two"style="width:130px;height:50px;text-decoration:none;background-color:rgb(50,205,50);" data-toggle="modal"><span>Refresh</span></a>	
                  
				<a href="" class="button-two"style="width:130px;height:50px;text-decoration:none;" data-toggle="modal"><span>Applies</span></a>
			
                </div>
            </div>
                       <div class="rcorners3"> 
                                     <form action="UserInternApplyServlet" method="post" enctype="multipart/form-data"id="internshipapply">

            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th  style="font-size:30px;color:black;width:100vh">Internship's</th>
                       
                       
                    </tr>
                </thead>
                
                <tbody>
                
                    <c:forEach var="intern" items="${listIntern}">
                                       <tr>
                               			
                                    <td>
                                    <div class="table_content">
                                                                   <div class="left_side">
                               <div class="table_head1" ><c:out value="${intern.intern_role}"/>
                                                                       <br><c:out value="${intern.company_name}"/>
                                        <br><span style="font-size:14px;font-weight: 600;color:black">Description : </span><c:out value="${intern.intern_description}"/>
                                        <br><span style="font-size:14px;font-weight: 600;color:black" >Working Type : </span><c:out value="${intern.intern_type}"/>
                                        <br><span style="font-size:14px;font-weight: 600;color:black">Duration : </span><c:out value="${intern.intern_duration}"/>
                                        <br><span style="font-size:14px;font-weight: 600;color:black">Stipend : </span><c:out value="${intern.intern_stipend}"/>
                                        <br><span style="font-size:14px;font-weight: 600;color:black">Office Location : </span><c:out value="${intern.intern_location}"/>
                                        </div> 
                                        </div>
                                        <div class="right_side">
                                        <div class="vertical-center">
                       <input type="hidden" id="uid"  name="uid" form="internshipapply" value="<%=session.getAttribute("uid") %>" />
                       <input type="hidden" id="intern_id"  name="intern_id" form="internshipapply" value="${intern.intern_id}" />
                        <button class="button-two"type="submit" name="signup" style="margin:100px 0 10px 0"class="form-submit" form="internshipapply"><span>Apply</span></button>
                       
                                        
                                        </div>
                                        
                                        </div>
                                        </div>
                                        <br>
                                        <div class="h_line"></div>
                                        
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                            
              </tbody>
              
            </table>
            </form>
           
            </div>
			 
        </div>
    </div>
											</div>	
						
</div>
			
			</div>
			</div>
		</section>

</body>

 <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "loggedin"){
		swal("<%=session.getAttribute("u_name") %>","You have logged in successfully.","success");
	}
	else if(status == "success1"){
		swal("Congrats","You have successfully added Educational Information.","success");
	}
	else if(status == "failed1"){
		swal("Sorry","Something went wrong.","error");
	}
	</script>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script> 
  <script>
    const body = document.querySelector("body");
    const navbar = document.querySelector(".navbar");
    const menuBtn = document.querySelector(".menu-btn");
    const cancelBtn = document.querySelector(".cancel-btn");
    menuBtn.onclick = ()=>{
      navbar.classList.add("show");
      menuBtn.classList.add("hide");
      body.classList.add("disabled");
    }
    cancelBtn.onclick = ()=>{
      body.classList.remove("disabled");
      navbar.classList.remove("show");
      menuBtn.classList.remove("hide");
    }
    window.onscroll = ()=>{
      this.scrollY > 20 ? navbar.classList.add("sticky") : navbar.classList.remove("sticky");
    }
    
  </script>
<script>document.querySelector('body').addEventListener('click', event => {
                	    if (event.target.matches('#submit1')) {
                	    	event.preventDefault();
                	    	       
                	    	    }
                	    	});
  </script>
  <script>
  
  document.querySelector('body').addEventListener('click', event => {
	    if (event.target.matches('#submit2')) {
	    	event.preventDefault();
	    	       
	    	    }
	    	});
  
  
  </script>
  <script>
  document.querySelector('body').addEventListener('click', event => {
                	    if (event.target.matches('#submit3')) {
                	    	event.preventDefault();
                	    	       
                	    	    }
                	    	});
  </script>
  <script>
  
  document.querySelector('body').addEventListener('click', event => {
	    if (event.target.matches('#submit4')) {
	    	event.preventDefault();
	    	       
	    	    }
	    	});
  
  </script>
 <script>      
 $(document).ready(function(){
     
     $("#confirm_password").bind('keyup change', function(){

       check_Password( $("#password").val(), $("#confirm_password").val() )
       
       
     })

     $("#sign_in_btn").click(function(){

       check_Password( $("#password").val(), $("#confirm_password").val() )

     })
   })

   function check_Password( Pass, Con_Pass){

     if(Pass === ""){

       

     }else if( Pass === Con_Pass){

       $("#sign_in_btn").removeAttr("onclick")
       $('#confirm_password_msg').show()
       $("#confirm_password_msg").html('<div class="alert alert-success">Password matched</div>')

       setTimeout(function() {
           $('#confirm_password_msg').fadeOut('slow');
       }, 3000);

     }else{
       $("#confirm_password").focus()
       $('#confirm_password_msg').show()
       $("#confirm_password_msg").html('<div class="alert alert-danger">Password did not matched</div>')

       setTimeout(function() {
           $('#confirm_password_msg').fadeOut('slow');
       }, 3000);

     }

   }</script>
  
<style>
.buttons {
margin: 0 auto;
display: inline;}

    .button-two {
margin: 0 auto;
display: inline;}
.title1 {
margin: 0 auto;
display: inline;
margin-right:100px}

:root {
  --main-blue: #71b7e6;
  --main-purple: #9b59b6;
  --main-grey: #ccc;
  --sub-grey: #d9d9d9;
}




.container form .user__details {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}

form .user__details .form-group {
  width: calc(100% / 2 - 20px);
}


.btn{
  margin:5px;
  -webkit-transition: background-color .5s ease-out;
  -moz-transition: background-color .5s ease-out;
  -o-transition: background-color .5s ease-out;
  transition: background-color .5s ease-out;
  border-width:1px;
  border-color:black;
  font-size:calc(0.65em + .7vmin);
}

.btn:hover{
  color:white;
}


/* ----------- BUTTON STYLES - OUTLINE OR FULL ----------- */
.btn-o{
  background-color:transparent;
  border-width:1px;
}
.btn-f{
  border-width:1px;
}

/* ----------- CORNER STYLES - ROUNDED OR SQUARE ----------- */
.btn-sq{
  border-radius:0px;
}
.btn-rnd{
  border-radius:4px;
}

/* ----------- BUTTON SIZES ----------- */
.btn-sm{
  padding:10px 18px;
}
.btn-md{
  padding:15px 35px;
}
.btn-lrg{
  padding:15px 65px;
}


.btn-o.btn-teal{
   background-color:transparent;
   color:#008489;
}
.btn-o.btn-teal:hover{
   background-color:#008489;
   color:white;
}

</style>
</html>
