<h1>HtmlPreviewer</h1>
Preview and Save HTML code with shareable URL
<br>
<br>
<img title="HTML Previewer" width="800px" src="https://github.com/RivaIvanova/HtmlPreviewer/blob/main/HTMLPreviewer/wwwroot/html-previewer.PNG">
<br>

<h3>🛠️ TOOLS NEEDED: </h3>
<p> (At least the ones I used) </p>
<ul>
  <li> Visual Studio 2019 </li>
  <li> SQL Server 2019 </li>
  <li> Microsoft SQL Server Management Studio 18 </li>
</ul>
<br>

<h3>📖 WHAT DOES IT INCLUDE: </h3>
<ul>
  <li> Text area to write HTML and an area to render it </li>
  <li> Button <b>Run</b> to render the input </li>
  <li> Button <b>Save</b> to save the input in a relational database with create date and last edit date </li>
  <li> Button <b>Check Original</b> to check if the current code matches the one of an example created earlier </li>
  <li> Notification for the "Check Original" funtionality </li>
  <li> Shareable <b>URL</b> of the saved example which is shown on the browser address bar </li>
  <li> Auto save every 15sec</li>
</ul>
<br>

<h3>🗄️ SAMPLE DATABASE AND DATA </h3>
<ul>
  <li> 2 tables: HTMLs and HTMLVersions </li>
  <li> 3 added entities in table HTMLs </li>
  <li> 14 added entities in table HTMLVersions </li>
</ul>

<table>
<tbody>
<tr align="center">
 <td><strong>HTML Id</strong></td>
 <td><strong>HTML total versions</strong></td>
</tr>
<tr>
 <td align="center">1</td>
 <td align="center">10</td>
</tr>  
<tr>
 <td align="center">2</td>
 <td align="center">2</td>
</tr>
<tr>
 <td align="center">3</td>
 <td align="center">2</td>
</tr>  
<tbody>
<table>
  
<p>To access any of the already added example: /Home/HTML/{id} </p>
<br>
  
<h3>💻 HOW TO RUN: </h3>
<ol>
  <li> Clone the project </li>
  <li> Use the provided <b>html-previewer-db-script.sql</b> file to create the database with some sample data (copy the script and run it in SSMS18) </li>
  <li> Basically that's it, run the project in VS19 and start previewing HTMLs 😊 </li>
</ol>
