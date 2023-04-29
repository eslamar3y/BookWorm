<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegLog.aspx.cs" Inherits="back_end_project.RegLog" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="./css/Log.css" />
  </head>
  <body>
    <div class="container" id="container">
      <div class="form-container sign-up-container">
        <form action="#" runat="server">
          <h1>Create Account</h1>
          <div class="ddiv">
          <asp:TextBox ID="name" runat="server" Class="txt" placeholder="Username"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="name"></asp:RequiredFieldValidator>
          </div><div class="ddiv">
          <asp:TextBox ID="semail" runat="server" Class="txt" TextMode="Email" placeholder="Email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="semail"></asp:RequiredFieldValidator>
          </div><div class="ddiv">
          <asp:TextBox ID="spswd" runat="server" Class="txt" TextMode="Password" placeholder="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="spswd"></asp:RequiredFieldValidator>
          </div><div class="ddiv">
          <asp:TextBox ID="phone" runat="server" Class="txt" placeholder="Phone Number"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="phone"></asp:RequiredFieldValidator>
          </div><div class="ddiv">
          <asp:TextBox ID="address" runat="server" Class="txt" placeholder="Address"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="address"></asp:RequiredFieldValidator>
          </div><div style="margin-left: 147px;margin-bottom: 20px;margin-top: -5px;color: #727070;">
          <input type="checkbox" onclick="showpsr()"/><small> Show Password</small>  </div>
          <asp:Label ID="AExists" runat="server" Text=""></asp:Label>
          <asp:Button ID="signup" runat="server" Text="Sign Up" Class="btn" OnClick="Register" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Email Format" ForeColor="Red" ControlToValidate="semail"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Charachter" ForeColor="Red" ControlToValidate="spswd" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&amp;])[A-Za-z\d$@$!%*#?&amp;]{8,}$"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Phone Format" ForeColor="#981d1d" ValidationExpression="^([0][1][0125][0-9]{8})$" ControlToValidate="phone"></asp:RegularExpressionValidator>
        

        </form>
      </div>
      <div class="form-container sign-in-container">
        <form action="#" method="post">
          <h1>Sign in</h1>
          <input type="email" name="email" placeholder="Email" class="txt" required/>
            
          <input type="password" name="pass" placeholder="Password" class="txt" required id="pass"/>
            <div style="margin-left: 147px;margin-bottom: 20px;margin-top: -5px;">
          <input type="checkbox" onclick="showps()"/><small> Show Password</small>  </div>
          <%--<a href="#">Forgot your password?</a>--%>
          <asp:Label ID="AExists2" runat="server" Text=""></asp:Label>
          <button name="login" class="btn">Sign In</button>
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1>Welcome Back!</h1>
            <p>
              To keep connected with us please login with your personal info
            </p>
            <button class="btn ghost" id="signIn">Sign In</button>
          </div>
          <div class="overlay-panel overlay-right">
            <h1>Hello, Friend!</h1>
            <p>Enter your personal details and start journey with us</p>
            <button class="btn ghost" id="signUp">Sign Up</button>
          </div>
        </div>
      </div>
    </div>
    <script src="./js/Log.js"></script>
  </body>
</html>
