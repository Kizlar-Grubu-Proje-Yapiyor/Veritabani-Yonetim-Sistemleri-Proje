<html>
<body>



<form action="islem.php" method="post">
  <label > name :</label>
  <input type="text"  name="name">

  <input type="submit" value="Göster">
</form> 



</body>
</html>


<?php 

for($i = 0 ; $i<$_POST['name'] ; $i++)
{
    echo 'Merhaba ';
    echo $i+1;
    echo '<br>';
}

?>