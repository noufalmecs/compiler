<html>
<head>
<title></title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../OIDE/doc/docs.css" rel="stylesheet">
<link rel="stylesheet" href="../OIDE/addon/hint/show-hint.css">
<link rel="stylesheet" href="../OIDE/demo/theme/dracula.css">
<link href="../OIDE/lib/codemirror.css" rel="stylesheet">
<script src="../OIDE/lib/codemirror.js"></script>
<script type="text/javascript" src="../OIDE/lib/jquery.js"></script>
<script type="text/javascript" src="../OIDE/lib/skulpt.min.js"></script>
<script type="text/javascript" src="../OIDE/lib/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../OIDE/lib/skulpt-stdlib.js"></script>
<script src="../OIDE/addon/hint/show-hint.js"></script>
<script src="../OIDE/addon/hint/anyword-hint.js"></script>
<script src="../OIDE/addon/hint/clike.js"></script>
<script src="../OIDE/addon/hint/python.js"></script>
<script src="../OIDE/addon/hint/ruby.js"></script>
<script src="../OIDE/addon/hint/perl.js"></script>
<script src="../OIDE/mode/javascript/javascript.js"></script>
<script src="../OIDE/addon/mode/loadmode.js"></script>
<script src="../OIDE/mode/meta.js"></script>
<script src="../OIDE/addon/edit/closebrackets.js"></script>
<script src="../OIDE/addon/edit/matchbrackets.js"></script>
<script src="../OIDE/mode/markdown/markdown.js"></script>
<!-- <link rel="stylesheet" href="../OIDE/demo/assets/css/demo.css"> -->
<link rel="stylesheet" href="../OIDE/demo/assets/css/header-basic.css">
<style type="text/css">
.test {
	margin: 0 auto;
}

.custom-file-upload {
	border-radius: 8px;
	background-color: #d3d3d3;
	border: 1px solid #ccc;
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}

.CodeMirror {
	border: 1px solid black;
	margin: auto;
	display: block;
}

.small-editor-button {
	margin-left: 10px;
	background: #fff;
	border: ipx solid #d5d5d5;
	padding: 0 8 px;
	width: 30px;
	height: 30px;
	color: #888;
	transition: all .3s;
	vertical-align: middlel
}

.button {
	width: 75px;
	height: 35px;
	background-color: #d3d3d3;
	border: none;
	color: black;
	border-radius: 8px;
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function()
		{
	$('#bttHello').click(function(){
		//var code=$('#code').val();
		var code=editor.getValue();
		var template=$('#insert').val();
		var cmd=$('#command').val();
		var cusinput=$('#textfield2').val();
		//console.log(code);
		$.ajax({
	    type:'GET',
	    data: {code: code,
	    template: template,
	    cmd:cmd,
	    cusinput:cusinput
	    },
	    
		url:'IdeServlet',
		success: function(result)
		{
			$('#txtr').html(result);
		}
		});
	});
	
		});
</script>

<script>
function toggleTextArea() {
	var theCheck = document.getElementById("checkbox");
	var theTextArea =document.getElementById("textfield2");
	if(theCheck.checked == true) {
		theTextArea.style.display = "block";
	} else {
		theTextArea.style.display = "none";
	}
}

</script>
<script>
  $(function () {
        $("#insert").change(function () {
            if (($(this).val() == "JAVA 7")||($(this).val() == "JAVA 8")||($(this).val() == "JAVA 9")) {
                $("#dvPassport").show();
            } else {
                $("#dvPassport").hide();
            }
        });
    });
</script>
<script>
function resize()
{
document.getElementById('code').style.height=screen.availHeight;
}
</script>

<script>
function toggleTextArea1() {
	
	var theCheck = document.getElementById("checkbox1");
	var theTextArea =document.getElementById("command");
	if(theCheck.checked == true) {
		theTextArea.style.display = "block";
	} else {
		theTextArea.style.display = "none";
	}
	
}
</script>
<script>
function disp(){
console.log(editor.getValue());	
}

</script>


<script>
function saveTextAsFile() {
    var textToWrite = editor.getValue();
    var textFileAsBlob = new Blob([textToWrite], {type:"text/plain;charset=utf-8"});
    var exet=document.getElementById("insert");
   var i=exet.options[exet.selectedIndex].value;
var exec="";
		if (i=="C") {
				exec = "c";
		} else if (i=="C++") {
			exec = "cpp";
		} else if (i=="JAVA 7"||i=="JAVA 8"||i=="JAVA 9") {
			
			exec = "java";
		} 
		 else if (i=="PYTHON 2.7.14"||i=="PYTHON 3.6.3") {
			
			exec = "py";
		}else if (i=="RUBY 2.2.3") {
			
			exec = "rb";
		} else if (i=="PERL") {
			
			exec = "pl";
		}
    var fileNameToSaveAs = "code."+exec;

    var downloadLink = document.createElement("a");
    downloadLink.download = fileNameToSaveAs;
    downloadLink.innerHTML = "Download File";
    if (window.webkitURL != null)
    {
        downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
    }
    else
    {
        downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
        downloadLink.onclick = destroyClickedElement;
        downloadLink.style.display = "none";
        document.body.appendChild(downloadLink);
    }
    downloadLink.click();}
function destroyClickedElement(event) {
    document.body.removeChild(event.target);}

function loadfile(input){
	 var filename = input.value;
     var lastIndex = filename.lastIndexOf("\\");
     if (lastIndex >= 0) {
         filename = filename.substring(lastIndex + 1);
     } 
     var fileupdate=filename.split(".");
     var reader = new FileReader();
     reader.onload = function(e) {
         editor.setValue(e.target.result);
        };
     if(fileupdate[1]=="c")
     {
    	   reader.readAsText(input.files[0]);
    	   document.getElementById("insert").value="C";    
    	    } else if(fileupdate[1]=="cpp")
    	    {
reader.readAsText(input.files[0]);
    	        document.getElementById("insert").value="C++";
    	        }else if(fileupdate[1]=="py")
    	        {
reader.readAsText(input.files[0]);
    	            document.getElementById("insert").value="PYTHON 3.6.3";
    	            }else if(fileupdate[1]=="rb")
    	            {
reader.readAsText(input.files[0]);
    	                document.getElementById("insert").value="RUBY 2.2.3";
    	                }else if(fileupdate[1]=="pl")
    	                {
reader.readAsText(input.files[0]);
    	                    document.getElementById("insert").value="PERL";
    	                    }
    	                else if(fileupdate[1]=="java")
		{
 
 reader.readAsText(input.files[0]);
 document.getElementById("insert").value="JAVA 8";
 $("#dvPassport").show();
 console.log(editor.getValue(),fileupdate[1]);
		}
    	                	else
		{
		alert("Invalid file type!!! please upload files with extension .java,.c,.cpp,.rb,.pl,.py");
		}
     
     change2(fileupdate[1]);
}
    var input = document.getElementById("select");
    function outf(text) { 
    var mypre = document.getElementById("output"); 
    mypre.innerHTML = mypre.innerHTML + text;
    
} 
    	/*var id="insert"
    	    var oldInput = document.getElementById(id); 

    
    	    var newInput = document.createElement("input"); 

    	    newInput.type = "file"; 
    	    newInput.id = oldInput.id; 
    	    newInput.name = oldInput.name; 
    	    newInput.className = oldInput.className; 
    	    newInput.style.cssText = oldInput.style.cssText; 
    	    // TODO: copy any other relevant attributes 

    	    oldInput.parentNode.replaceChild(newInput, oldInput);
    */
function builtinRead(x) {
    if (Sk.builtinFiles === undefined || Sk.builtinFiles["files"][x] === undefined)
            throw "File not found: '" + x + "'";
    return Sk.builtinFiles["files"][x];
}
</script>
</head>
<body onload="change1()">
	<header class="header-basic">
		<div class="header-limiter">
			<h1>
				<img src="../OIDE/demo/assets/images/logo1.png" height="29"
					width="193">
			</h1>
			<nav>

				<a href="demo/index.html">Home</a>
			</nav>
		</div>
	</header>
	</br>
	<br>
	<div 
		style="width: 1000px; background-color: #808080; margin: 0 auto; border: 2px solid #d3d3d3; border-radius: 8px;">
		<TABLE style="">
			<colgroup>
				<col span="1" style="width: 22%;">
				<col span="1" style="width: 58%;">
				<col span="1" style="width: 20%;">
			</colgroup>
			<tbody>
				<TR>
					<td></td>
					<td>
						<h4>
							<P ALIGN=center style="font-family: Comic Sans MS;">
								CHOOSE LANGUAGE
								<SELECT id="insert" name="template" style="width: 150px; height: 35px; background-color: white; font-family: Comic Sans MS;"
									onclick="change1()">
									<option value="C" >C</option>

									<option value="C++" >C++</option>

									<option value="JAVA 7" >JAVA 7</option>

									<option value="JAVA 8" >JAVA 8</option>

									<option value="JAVA 9" >JAVA 9</option>

									<option value="PYTHON 2.7.14" >PYTHON 2.7.14</option>

									<option value="PYTHON 3.6.3" >PYTHON 3.6.3</option>

									<option value="RUBY 2.2.3" >RUBY 2.2.3</option>

									<option value="PERL" >PERL</option>
								</select>
							</P>
						</h4>
						<article>
				     			<%
								String program ="";
								program = request.getAttribute("program") + "";
								%>
							<TEXTAREA id="code" name="code"  >
						    </TEXTAREA>
						    <script>
							CodeMirror.modeURL = "../mode/%N/%N.js";
							var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
							lineNumbers: true
							,autoCloseBrackets:true,matchBrackets:true
							});
							var theme="dracula";
							editor.setOption("theme", theme);
  function topfn()
  {
	  document.getElementById("txtr").focus();
	  
  }
  function change1() {
	  var e = document.getElementById("insert");
	  var con= e.options [e.selectedIndex] .value;
	  var content="";
      var val, m, mode, spec;
		  if(con=="C"){
	      val="text/x-csrc";
	    		    content="#include<stdio.h>\nint main()\n{\nprintf(\"welcome to phoenix compiler!!!\");\nreturn 0;\n}";
	    		    document.getElementById("textfield2").value="";
	    		    document.getElementById("checkbox").checked=false;
	    		    document.getElementById("textfield2").style.display = "none";
	       var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="C++"){
	      val="text/x-c++src";
	      content="#include<iostream>\nusing namespace std;\nint main()\n{\ncout<<\"welcome to phoenix compiler!!!\";\nreturn 0;\n}"; 
	      document.getElementById("textfield2").value="";
	      document.getElementById("checkbox").checked=false;
	      document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="JAVA 7"){
	      val="text/x-java";
	      content="public class demo\n{\npublic static void main(String[] args)\n{\nSystem.out.println(\"welcome to phoenix compiler!!!\");\n}\n}"
	    	  document.getElementById("textfield2").value="";
	    	  document.getElementById("command").value="";
	    	  document.getElementById("checkbox").checked=false;
	    	  document.getElementById("checkbox1").checked=false;
	    	  document.getElementById("command").style.display = "none";
	    	  document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="JAVA 8"){
	      val="text/x-java";
	      content="public class demo\n{\npublic static void main(String[] args)\n{\nSystem.out.println(\"welcome to phoenix compiler!!!\");\n}\n}"
	    	  document.getElementById("textfield2").value="";
	    	  document.getElementById("command").value="";
	    	  document.getElementById("checkbox").checked=false;
	    	  document.getElementById("checkbox1").checked=false;
	    	  document.getElementById("command").style.display = "none";
	    	  document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="JAVA 9"){
	      val="text/x-java";
	      content="public class demo\n{\npublic static void main(String[] args)\n{\nSystem.out.println(\"welcome to phoenix compiler!!!\");\n}\n}"
	    	  document.getElementById("textfield2").value="";
	    	  document.getElementById("command").value="";
	    	  document.getElementById("checkbox").checked=false;
	    	  document.getElementById("checkbox1").checked=false;
	    	  document.getElementById("command").style.display = "none";
	    	  document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="PYTHON 2.7.14"){
	      val="text/x-python";
	      content="# print \"WELCOME TO PHOENIX COMPILER!!!\";"; 
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="PYTHON 3.6.3"){
	      val="text/x-python";
	      content="# print(\"WELCOME TO PHOENIX COMPILER!!!\")";
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="RUBY 2.2.3"){
	      val="text/x-ruby";
	      content="# puts \"WELCOME TO PHOENIX COMPILER!!!\"";
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="PERL"){
	      val="text/x-perl";
	      content="# print \"WELCOME TO PHOENIX COMPILER!!!\";"; 
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	    if (m = /.+\.([^.]+)$/.exec(val)) {
	      var info = CodeMirror.findModeByExtension(m[1]);
	      if (info) {
	        mode = info.mode;
	        spec = info.mime;
	      }
	    } else if (/\//.test(val)) {
	      var info = CodeMirror.findModeByMIME(val);
	      if (info) {
	        mode = info.mode;
	        spec = val;
	      }
	    } else {
	      mode = spec = val;
	    }
	    if (mode) {

	    	editor.setOption("mode", spec);
	      editor.setValue(content); 
	      CodeMirror.autoLoadMode(editor, mode);
	    } 
	    else {
	      alert("Could not find a mode corresponding to " + val);
	    }
	   
	    var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";
	  }
  function change2(con) {
      var val, m, mode, spec;
		  if(con=="c"){
	      val="text/x-csrc";
	    		    document.getElementById("textfield2").value="";
	    		    document.getElementById("checkbox").checked=false;
	    		    document.getElementById("textfield2").style.display = "none";
	       var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="cpp"){
	      val="text/x-c++src";
	      
	      document.getElementById("textfield2").value="";
	      document.getElementById("checkbox").checked=false;
	      document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="java"){
	      val="text/x-java";
	      
	    	  document.getElementById("textfield2").value="";
	    	  document.getElementById("command").value="";
	    	  document.getElementById("checkbox").checked=false;
	    	  document.getElementById("checkbox1").checked=false;
	    	  document.getElementById("command").style.display = "none";
	    	  document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";
		  }
	
	  else if(con=="py"){
	      val="text/x-python";
	      
	       
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="rb"){
	      val="text/x-ruby";
	  
	      
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  else if(con=="pl"){
	      val="text/x-perl";
	    
	      
	        document.getElementById("textfield2").value="";
	        document.getElementById("checkbox").checked=false;
	        document.getElementById("textfield2").style.display = "none";
	      var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";}
	  
	    if (m = /.+\.([^.]+)$/.exec(val)) {
	      var info = CodeMirror.findModeByExtension(m[1]);
	      
	      if (info) {
	        mode = info.mode;
	        spec = info.mime;
	      }
	    } else if (/\//.test(val)) {
	      var info = CodeMirror.findModeByMIME(val);
	      if (info) {
	        mode = info.mode;
	        spec = val;
	      }
	    } else {
	      mode = spec = val;
	    }
	    if (mode) {

	    	editor.setOption("mode", spec);
	   
	      CodeMirror.autoLoadMode(editor, mode);
	      console.log(editor.getValue());
	     
	    } 
	   
	    var mac=CodeMirror.keyMap.default==CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac?"Cmd":"Ctrl")+"-Space"]="autocomplete";
		  
	  }

</script>
<script>
</script>
						</article>

						<div id="dvPassport" style="display: none">
							<br> <input name="checkbox" type="checkbox" id="checkbox1"
						onchange="toggleTextArea1();" value="1" />COMMANDLINE ARGUMENTS... </br> <br>
							<textarea name="command" id="command" rows="4" cols="60"
								style="border-radius: 8px;display:none"></textarea>
							</BR>
						</div> <!--
<button title="Download Code" class="small-editor-button fa fa-download" data-ember-action="400" onClick="saveTextAsFile()"></button>
<button title="Go FullScreen" class="small-editor-button fa fa-expand" data-ember-action="858" onclick="resize()"></button>
<button title="Exit FullScreen" class="small-editor-button fa fa-compress" data-ember-action="801" onclick="document.getElementById('code').style.height='500';"></button>-->
						<BR>
						 <input name="checkbox" type="checkbox" id="checkbox"
						onchange="toggleTextArea();" value="1" />CUSTOM INPUT...</BR> 
						
						<BR>
						<textarea style="display: none; border-radius: 8px"
							name="textfield2" id="textfield2" rows="4" cols="60">


</textarea> </BR> 
<BR>
						<p align="center">
							
							<INPUT TYPE="SUBMIT" CLASS="button" value="SAVE"
								OnClick="saveTextAsFile();">
							<INPUT  TYPE="SUBMIT" class="button" VALUE="RUN" id="bttHello" onclick="disp();topfn();"> 
							<label
								for="toup" class="custom-file-upload"> 
								<input
								type="file" name="file"  accept=".java,.c,.cpp,.pl,.py,.rb" id="toup"
								style="width: 200px;" onChange="loadfile(this)"></label>  UPLOAD FILE<BR>
						
'						</p> </BR>

<BR>STDOUT...</BR> <BR>  

<textarea readonly id="txtr"
							style="border-radius: 8px; background-color: #1e1d1d; color: #fff"
							class="txtr" rows="7" cols="80">

</textarea> </BR> 	
				
					</TD>
					<td></td>
				</TR>
		</TABLE>
	</div>
</body>
</html>
