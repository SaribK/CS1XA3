function openResume() //open file thats called Resume.pdf
{
    window.location.href='Resume.pdf'
}
function openFirstNav() { //change side navigation size to full size
    document.getElementById("mySidenav").style.width = "100%";
}
function closeFirstNav() { //shrink the nav to 0 size (hide it)
    document.getElementById("mySidenav").style.width = "0";
}
function openSecondNav() {
    document.getElementById("mySidenav2").style.width = "100%";
}
function closeSecondNav() {
    document.getElementById("mySidenav2").style.width = "0";
}
function openThirdNav() {
    document.getElementById("mySidenav3").style.width = "100%";
    $(".nav-bar").slideUp(500);
}
function closeThirdNav() {
    document.getElementById("mySidenav3").style.width = "0";
    $(".nav-bar").slideDown(500);
}
function openFourthNav() {
    document.getElementById("mySidenav4").style.width = "100%";
    $(".nav-bar").slideUp(500);
}
function closeFourthNav() {
    document.getElementById("mySidenav4").style.width = "0";
    $(".nav-bar").slideDown(500);
}
var navbar = document.getElementsByClassName("nav-bar")
function toggleDarkMode()
{
    document.body.classList.toggle("dark-mode"); //switch between adding and removing dark-mode class
    var elements = document.getElementsByClassName('dark'); //get all elements with in class dark and textColor 
    var text = document.getElementsByClassName('textColor'); 
    for(var i = 0; i < text.length; i++)
    { //toggle the text elements between dark and light depending on previous color
        if (text[i].style.color == "white")
        {
            text[i].style.color = "black";
        }
        else
        {
            text[i].style.color = "white";
        }
        $(".dark-button").fadeOut(function () { //use JQuery to change the text on button depending on what it previously was
            $(".dark-button").text(($(".dark-button").text() == 'Dark Mode') ? 'Light Mode' : 'Dark Mode').fadeIn(500);
        })
	}
    for(var i = 0; i < elements.length; i++)
    {
        if (elements[i].style.backgroundColor == "darkgrey")
        {
            elements[i].style.backgroundColor = "mintcream";
        }
        else 
        {
            elements[i].style.backgroundColor = "darkgrey";
        }
	}
}
$(document).ready(function(){
    $("#navHide").hide(); //hide all sideNavs when document loads
    $("#navHide2").hide(); 
    $("#navHide3").hide(); 
    $("#navHide4").hide(); 
    $("#nav1").click(function()
        {
            $(".nav-bar").slideUp(500); //hide the nav bar on top of screen when any side nav is opened
            $("#navHide").show(500); //show text after side nav is shown
        });
    $("#nav2").click(function()
        {
            $(".nav-bar").slideUp(500); 
            $("#navHide2").show(500); 
        });
    $("#nav3").click(function()
        {
            $(".nav-bar").slideUp(500); 
            $("#navHide3").show(500); 
        });
    $("#nav4").click(function()
        {
            $(".nav-bar").slideUp(500); 
            $("#navHide4").show(500); 
        });
    $(".closebtn").click(function()
        {
            $(".nav-bar").slideDown(500);
            $("#navHide").hide();
        });
    $(".navbtn2").click(function()
        {
            $(".nav-bar").slideDown(500);
            $("#navHide2").hide();
        });
    $(".navbtn3").click(function()
        {
            $(".nav-bar").slideDown(500);
            $("#navHide3").hide();
        });
    $(".navbtn4").click(function()
        {
            $(".nav-bar").slideDown(500);
            $("#navHide4").hide();
        });
    $("#visible").click(function()
    {
        $("#invisible").slideToggle(500); //show or hide the skill description
    });
    $("#visible2").click(function()
    {
        $("#invisible2").slideToggle(500);
    });  
    $("#visible3").click(function()
    {
        $("#invisible3").slideToggle(500);
    });  
    $("#visible4").click(function()
    {
        $("#invisible4").slideToggle(500);
    });  
    $("#visible5").click(function()
    {
        $("#invisible5").slideToggle(500);
    });  
    $("#visible6").click(function()
    {
        $("#invisible6").slideToggle(500);
    });  
    $("#visible7").click(function()
    {
        $("#invisible7").slideToggle(500);
    });  
    $("#visible8").click(function()
    {
        $("#invisible8").slideToggle(500);
    });  
    $("#visible9").click(function()
    {
        $("#invisible9").slideToggle(500);
    });  
    $("#visible10").click(function()
    {
        $("#invisible10").slideToggle(500);
    });  
    $("#visible11").click(function()
    {
        $("#invisible11").slideToggle(500);
    });  
    $("#visible12").click(function()
    {
        $("#invisible12").slideToggle(500);
    });
    $(".fixed-button").click(function()
    {
        $(".fixed-button").fadeOut(function () { //toggle button text
            $(".fixed-button").text(($(".fixed-button").text() == 'Next') ? 'Previous' : 'Next').fadeIn();
        })
        $(".education").slideToggle(1000); //toggle between education/work and volunteer/certifications
        $(".work").slideToggle(1000);
        $(".volunteer").slideToggle(1000);
        $(".certifications").slideToggle(1000);
    });
});
