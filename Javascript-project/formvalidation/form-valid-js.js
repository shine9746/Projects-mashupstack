function formvalidation(events){

    events.preventDefault();

    var validname = /^[a-zA-Z]+ [a-zA-Z]+$/;        
    var name= document.getElementById("fullname").value.trim();
    var emailvalid = /^\S+@\S+$/;
    var email = document.getElementById("emailaddress").value.trim(); 
    var passwordvalid = /^[A-Za-z]\w{6,15}$/;
    var password = document.getElementById("password").value.trim();
    var confirmpassword = document.getElementById("reenterpassword").value.trim();
    var contactnovalid  = /^\+?([0-9]{2})\)?[-. ]?([0-9]{5})[-. ]?([0-9]{5})$/;
    var contactno = document.getElementById("contactnumber").value.trim();
    

//name validation
    if(name==""){
        document.getElementById("nameerror").innerHTML = "Please enter your full name"     
        return false;   
    }

    if(!/^[a-zA-Z\s]*$/g.test(name)){
        document.getElementById("nameerror").innerHTML = "Invalid name"       
        return false;
    }

    if(!validname.test(name)){
        document.getElementById("nameerror").innerHTML = "Enter your full name";
        return false  ; 
    }
    
    else{
        document.getElementById("nameerror").innerHTML = "";
    }


    //email validation

    if(email==""){
        document.getElementById("emailerror").innerHTML = "Please enter your email address";       
        return false;  
    
    }

    if(!emailvalid.test(email)){
        document.getElementById("emailerror").innerHTML = "Enter a valid email address";
    }
    else{
        document.getElementById("emailerror").innerHTML = "";
    }


    //password validation

    if(password==""){
        document.getElementById("passworderror1").innerHTML = "Please enter your password";
        return false;
    }

    if(!passwordvalid.test(password)){
        document.getElementById("passworderror1").innerHTML = "Please enter a valid password";
        return false;
    }

    
    else{
        document.getElementById("passworderror1").innerHTML = "";
    }

    //confirm password

    if(confirmpassword==""){
        document.getElementById("passworderror2").innerHTML = "Please enter your password";
        return false;
    }

    if(confirmpassword !==password){
        document.getElementById("passworderror2").innerHTML = "Your password is not matching";
        return false;
    }
    
    else{
        document.getElementById("passworderror2").innerHTML = "";
    }

    //contact number

    if(contactno==""){
        document.getElementById("contacterror").innerHTML = "Please enter your conctact number";
        return false;
    }

    if(!contactnovalid.test(contactno)){
        document.getElementById("contacterror").innerHTML = "Please enter a valid number";
        return false;
    }

    else{
        document.getElementById("contacterror").innerHTML = "";
    }


    }


    