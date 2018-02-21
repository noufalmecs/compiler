<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
$(document).ready(function() {
	   $('#btn-example-file-reset').on('click', function(e) {
	      var $el = $('#example-file');
	      $el.wrap('<form>').closest('form').get(0).reset();
	      $el.unwrap();
	   });
	});

</script>
</head>
<body>
<div>
   <p>
      <label>Name</label><br>
      <input value="John Doe" type="text">
   </p>
   <p>
      <label>File</label><br>
      <input id="example-file" type="file">
   </p>
   <p>
      <button id="btn-example-file-reset" type="button" >Reset file</button>
   </p>
</div>

</body>
</html>