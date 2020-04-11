<html>
<head>
	<title>Upload Berhasil<</title>
</head>
<body>
 
	<center><h1>Upload Sukses</h1></center>
 
	<ul>
		<?php foreach ($upload_data as $item => $value):?>
			<li><?php echo $item;?>: <?php echo $value;?></li>
		<?php endforeach; ?>
	</ul>	
 
</body>
</html>