<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 
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
    <a href="user_section.jsp"style="text-decoration:none;"><div class="logo">Placement and Assistance System</div></a>
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
<div class="signup-image" style="margin-top:-8px">
		<div class="student-profile py-4">
  
     
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
           <div class="rcorners3"> 
          
          <div class="card-body pt-0">
            <table class="table table-bordered">
               <tr>
                <th width="100%">User ID</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("uid") %></td>
              </tr>
               <tr>
                <th width="100%">Name</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_name") %></td>
              </tr>
               <tr>
                <th width="100%">Username</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_uname") %></td>
              </tr>
               <tr>
                <th width="100%">Gender</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_gender") %></td>
              </tr>
              <tr>
                <th width="100%">Date of Birth</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_dob") %></td>
              </tr>
              <tr>
                <th width="100%">E-mail</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_email") %></td>
              </tr>
              <tr>
                <th width="100%">Contact No</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_mobno") %></td>
              </tr>
              <tr>
                <th width="100%">Address</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_address") %></td>
              </tr>
              <tr>
                <th width="100%">Working Status</th>
                <td width="2%">:</td>
                <td><%=session.getAttribute("u_status") %></td>
              </tr>
            </table>
          </div>
    </div>
     <button class="button-two"style="margin:30px 0 30px 30px"><a href="user_update.jsp"style="text-decoration:none;color:white;">Update User Profile</a></button>
           <form action="UserEduListServlet" method="post"><input type="hidden" id="user_uid" name="user_uid" value="<%=session.getAttribute("uid") %>"><button class="button-two"style="margin:30px 0 30px 30px;background-color:rgb(50,205,50);width:230px"class="profilebtn">User's Educational Profile</button></form>
     

     
      
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
	if(status == "done"){
		swal("Welcome","<%=session.getAttribute("u_name") %>","done");
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

form .user__details .form-<%=session.getAttribute("uid") %> {
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
