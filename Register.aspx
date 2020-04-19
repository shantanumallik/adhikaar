<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Register.aspx.cs" Inherits="images_Register" Title="Register - Adhikaar" MasterPageFile="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>


<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ADHIKAAR</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <style type="text/css">
        
        #RadioButtonList1{
            display:inline;
        }
        label{
            margin-right: 40px;
        }
    </style>
</head>
<body>

    <!--Nav bar-->
<form id="form1" runat="server">
    <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

    


    <nav class="orange" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Default.aspx" class="brand-logo">ADHIKAAR</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="Elections.aspx">ELECTIONS</a></li>
                <li><a href="Register.aspx">REGISTER</a></li>
                <li><a href="Contact.aspx">CONTACT</a></li>
                <li style="text-transform:uppercase;">
                    <asp:LoginName ID="LoginName1" runat="server" />
                </li>
                <li style="text-transform:uppercase;">
                    <asp:LoginStatus ID="LoginStatus1" runat="server"/>
                </li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <li><a href="Elections.aspx">ELECTIONS</a></li>
                <li><a href="Register.aspx">REGISTER</a></li>
                <li><a href="Contact.aspx">CONTACT</a></li>
                <li>
                        <a href="#" style="text-transform:uppercase;"><asp:LoginName ID="LoginName2" runat="server" /></a>
                    </li>
                <li style="text-transform:uppercase;">
                    <asp:LoginStatus ID="LoginStatus2" runat="server"/>
                </li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
    <!--Nav bar End-->


    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br/><br/>
                <h1 class="header center white-text">REGISTER HERE</h1>
                <br/><br/>
            </div>
        </div>
        <div class="parallax"><img src="images/flag.jpg" alt="Unsplashed background img 1" /></div>
    </div>


    <div class="container">
        
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="firstname" type="text" class="validate" runat="server" maxlength="20" />
                    <label for="firstname">First Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="firstname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="lastname" type="text" class="validate" runat="server" maxlength="20"/>
                    <label for="lastname">Last Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="lastname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>

        <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="ffirstname" type="text" class="validate" runat="server" maxlength="20" />
                    <label for="ffirstname">Father's First Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="ffirstname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="flastname" type="text" class="validate" runat="server" maxlength="20"/>
                    <label for="flastname">Father's Last Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="flastname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>

        <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="mfirstname" type="text" class="validate" runat="server" maxlength="20" />
                    <label for="mfirstname">Mother's First Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="mfirstname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="mlastname" type="text" class="validate" runat="server" maxlength="20"/>
                    <label for="mlastname">Mother's Last Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="mlastname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>




            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">perm_identity</i>
                    <input id="aadhaar" type="text" class="validate" runat="server" maxlength="12" />
                    <label for="aadhaar">Aadhaar number</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="aadhaar" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                 <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">perm_identity</i>
                    <input id="voterid" type="text" class="validate" runat="server" maxlength="12" />
                    <label for="aadhaar">Aadhaar number</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="voterid" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">location_on</i>
                    <input id="state" type="text" class="validate" runat="server" maxlength="30"/>
                    <label for="state">State</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="state" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>

                <div class="input-field col s6">
                    <i class="material-icons prefix">text</i>
                    <input id="bio" type="text" class="validate" runat="server" maxlength="500"/>
                    <label for="state">Bio</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="bio" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>


                <div class="row center-align">
                 <div class="input-field col s6">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="RSP" Value="rsp"></asp:ListItem>
                        <asp:ListItem Text="CNI" Value="cni"></asp:ListItem>
                        <asp:ListItem Text="SJP" Value="sjp"></asp:ListItem>
                        <asp:ListItem Text="AJP" Value="ajp"></asp:ListItem>
                        <asp:ListItem Text="SSP" Value="ssp"></asp:ListItem>                       
                     </asp:DropDownList>
                    <label>Party</label>
                </div>
                <div class="row center-align">
                 <div class="input-field col s6">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem Text="kalikapur" Value="Kalikapur"></asp:ListItem>
                        <asp:ListItem Text="kasba" Value="Kasba"></asp:ListItem>
                        <asp:ListItem Text="saltlake" Value="Salt Lake"></asp:ListItem>
                        <asp:ListItem Text="dumdum" Value="Dum Dum"></asp:ListItem>
                        <asp:ListItem Text="behala" Value="Behala"></asp:ListItem>                       
                        <asp:ListItem Text="sonarpur" Value="Sonarpur"></asp:ListItem>
                        <asp:ListItem Text="garia" Value="Garia"></asp:ListItem>
                    </asp:DropDownList>
                    <label>Constituency</label>
                </div>
                    </div>

            </div>
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">phone</i>
                    <input id="mobile" type="text" class="validate" runat="server" maxlength="10" pattern="^[789]\d{9}$" title="mob"/>
                    <label for="mobile">Mobile</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="mobile" CssClass="red-text"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not valid mobile number!" ValidationExpression="^[789]\d{9}$" ControlToValidate="mobile" CssClass="red-text"></asp:RegularExpressionValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">email</i>
                    <input id="email" type="email" class="validate" runat="server" />
                    <label for="email">Email</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="email" CssClass="red-text"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not a valid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" CssClass="red-text"></asp:RegularExpressionValidator>
                </div>              
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">today</i>
                    <input type="date" class="datepicker" id="birthdate" runat="server"/>
                    <label for="birthdate">Birthdate</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="birthdate" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
               
            
                <div class="input-field col s6">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Text="Btech" Value="btech"></asp:ListItem>
                        <asp:ListItem Text="Mtech" Value="mtech"></asp:ListItem>
                        <asp:ListItem Text="Phd" Value="phd"></asp:ListItem>
                        <asp:ListItem Text="MBA" Value="mba"></asp:ListItem>
                        <asp:ListItem Text="Btech + Mtech" Value="btechmtech"></asp:ListItem>                       
                        <asp:ListItem Text="Btech + MBA" Value="btechmba"></asp:ListItem>
                        <asp:ListItem Text="Mtech + Phd" Value="btechphd"></asp:ListItem>
                    </asp:DropDownList>
                    <label>Qualification</label>
                </div>
            </div>
            
            <div class="row center">
                         
                <div class="row center input-field col s6">
 
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="Male" Selected="True"><i class="material-icons left">wc</i>Male</asp:ListItem>
                            <asp:ListItem Value="Female"><i class="material-icons left">wc</i>Female</asp:ListItem>
                        </asp:RadioButtonList>  
                </div>
            </div>
            <div class="row center">
                <div class="col s4 offset-s4 input-field">
                    <i class="material-icons prefix">fingerprint</i>
                    <input id="pass" type="password" class="validate" runat="server"/>
                    <label for="pass">Biometrics</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Biometrics are required." ControlToValidate="pass" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
        <div class="row center">
                
            </div>  
            <div class="row center">
                
                      <img border="2" id="FPImage1" alt="Fingerpint Image" height="300" width="210" src=".\Images\PlaceFinger.bmp" /> 
                     
                </div>
            <div class="row center">
                 
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" onClientClick="CallSGIFPGetData(SuccessFunc1, ErrorFunc); return false"><i class="material-icons left">fingerprint</i>Capture Fingerprint</asp:LinkButton>
                    
                </div>
   
            <div class="row center">
                               
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light orange lighten-1 hoverable" onClick="LinkButton1_Click"><i class="material-icons left">person_add</i>Submit</asp:LinkButton>
            </div>  
        </div>
    
   <asp:TextBox ID="abc" style="display: none;" runat="server"></asp:TextBox>
         </form>
  


              
        
    <!--Form End-->
    <script type="text/javascript">
    var template_1 = "";
    var template_2 = "";

    function SuccessFunc1(result) {
        if (result.ErrorCode == 0) {
            /* 	Display BMP data in image tag
                BMP data is in base 64 format 
            */
            if (result != null && result.BMPBase64.length > 0) {
                document.getElementById('FPImage1').src = "data:image/bmp;base64," + result.BMPBase64;
                template_1 = result.TemplateBase64;
            }
                
            else
                template_1 = "NULL Value";

           var temp=atob(template_1);
            
          /* var tbl = "<table border=1>";
           tbl += "<tr>";
           tbl += "<td> Template(base64)</td>";
           tbl += "<td> <b> <textarea rows=30 cols=50>" + result.TemplateBase64 + "</textarea></b> </td>";
           tbl += "</tr>";
           tbl += "</table>";*/
           $(document).ready(function () {
               document.getElementById("<%=abc.ClientID%>").value = template_1;
               //document.getElementById('result1').innerText = result.TemplateBase64;
           });
       
           
        }
        else {
            alert("Fingerprint Capture Error Code:  " + result.ErrorCode + ".\nDescription:  " + ErrorCodeToString(result.ErrorCode) + ".");
        }
    }

     function ErrorFunc(status) {
        /* 	
            If you reach here, user is probabaly not running the 
            service. Redirect the user to a page where he can download the
            executable and install it. 
        */
        alert("Check if SGIBIOSRV is running; status = " + status + ":");
    }

     function CallSGIFPGetData(successCall, failCall) {
         
        var uri = "https://localhost:8443/SGIFPCapture";
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                fpobject = JSON.parse(xmlhttp.responseText);
                $(document).ready(function () {
               document.getElementById("<%=abc.ClientID%>").value = xmlhttp.responseText;
               //document.getElementById('result1').innerText = result.TemplateBase64;
           });
                //$('#abc').val(JSON.stringify(fpobject));

                //document.getElementById("<%=abc.ClientID%>").value = "";
                successCall(fpobject);
            }
            else if (xmlhttp.status == 404) {
                failCall(xmlhttp.status)
            }
        }
        xmlhttp.onerror = function () {
            failCall(xmlhttp.status);
        }
        var params = "Timeout=" + "10000";
        params += "&Quality=" + "50";
        params += "&licstr=" + encodeURIComponent(secugen_lic);
        params += "&templateFormat=" + "ISO";
        xmlhttp.open("POST", uri, true);
        xmlhttp.send(params);
    }

     function matchScore(succFunction, failFunction) {
      
        if (template_1 == "" || template_2 == "") {
            alert("Please scan two fingers to verify!!");
            return;
        }
        var uri = "https://localhost:8443/SGIMatchScore";

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                fpobject = JSON.parse(xmlhttp.responseText);
                succFunction(fpobject);
            }
            else if (xmlhttp.status == 404) {
                failFunction(xmlhttp.status)
            }
        }

        xmlhttp.onerror = function () {
            failFunction(xmlhttp.status);
        }
        var params = "template1=" + encodeURIComponent(template_1);
        params += "&template2=" + encodeURIComponent(template_2);
        params += "&licstr=" + encodeURIComponent(secugen_lic);
        params += "&templateFormat=" + "ISO";
        xmlhttp.open("POST", uri, false);
        xmlhttp.send(params);
    }

    function succMatch(result) {
        var idQuality = document.getElementById("quality").value;
        if (result.ErrorCode == 0) {
            if (result.MatchingScore >= idQuality)
                alert("MATCHED ! (" + result.MatchingScore + ")");
            else
                alert("NOT MATCHED ! (" + result.MatchingScore + ")");
        }
        else {
            alert("Error Scanning Fingerprint ErrorCode = " + result.ErrorCode);
        }
    }

    function failureFunc(error) {
        alert ("On Match Process, failure has been called");
    }

</script>
    
    
      
    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
    <%--<script src="Scripts/bootstrap.min.js" type="text/javascript"></script>--%>
    </body>


   
</asp:content>

    

