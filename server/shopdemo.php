<?php

	$host = "localhost";
	$username = "root";
	$password = "";
	$database = "shopdemo";

	$ACTION = $_POST['action'];

	$conn = mysqli_connect($host,$username,$password,$database);
	mysqli_query($conn,"SET NAME 'utf8'");
	

	// GET NEW PRODUCT
	if ($ACTION === 'GET_NEW_PRODUCT') {
			
		$sql=mysqli_query($conn,"select * from product ORDER BY id DESC limit 6 ");
		if($sql === FALSE) 
		{
			die(mysqli_error());
		}
		while($row=mysqli_fetch_assoc($sql))
			$response[]=$row;
		echo json_encode($response);
	
	}

	//GET DATA SMARTPHONE
	if($ACTION === 'GET_PHONE'){
		$sql=mysqli_query($conn,"select * from product where idcategory = 1");
		if($sql === FALSE) 
		{
			die(mysqli_error());
		}
		while($row=mysqli_fetch_assoc($sql))
			$response[]=$row;
		echo json_encode($response);
	}

	// GET DATA LAPTOP
	if($ACTION === 'GET_LAPTOP'){
		$sql=mysqli_query($conn,"select * from product where idcategory = 2");
		if($sql === FALSE) 
		{
			die(mysqli_error());
		}
		while($row=mysqli_fetch_assoc($sql))
			$response[]=$row;
		echo json_encode($response);
	}

	// GET DATA SEACRH PRODUCT
	if($ACTION === 'GET_SEACRH_PRODUCT'){
		
		$nameSearch =  $_POST['nameSearch'];

		$sql=mysqli_query($conn,"select * from product where name like '%$nameSearch%' ");
		if($sql === FALSE) 
		{
			die(mysqli_error());
		}
		else{
			while($row=mysqli_fetch_assoc($sql))
			$response[]=$row;
			echo json_encode($response);
		}
	}

	// POST ORDERS
	if ($ACTION === 'POST_ORDERS') {

		$namecustomer = $_POST['namecustomer'];
		$address = $_POST['address'];
		$phone = $_POST['phone'];
		$id_customer = $_POST['id_customer'];


		if (strlen($namecustomer) > 0 && strlen($phone) > 0 && strlen($address) > 0) {
		$query = "INSERT INTO `order`(id,namecustomer,address,phone,idcustomer) VALUES (null,'$namecustomer','$address','$phone','$id_customer');";
			if (mysqli_query($conn ,$query)) {
				$iddonhang = $conn -> insert_id;
				echo $iddonhang; 

			}else{
				echo "ERROR";
			}
			
		}else{
		echo "ERROR";
		}

	}

	// POST DETAILED ORDER
	if ($ACTION === 'POST_DETAILED_ORDER') {

		$id_order =  $_POST['id_order'];
		$id_product =  $_POST['id_product'];
		$name_product =  $_POST['name_product'];
		$price_product =  $_POST['price_product'];
		$quantity_product =  $_POST['quantity_product'];


		$queryR = "INSERT INTO detailorder (id,idorder,idproduct,nameproduct,priceproduct,quantityproduct) VALUES (null,'$id_order','$id_product','$name_product','$price_product','$quantity_product')";
		if (mysqli_query($conn ,$queryR)) {
			echo 'SUCCESS'; 
		}else{
			echo "ERROR";
		}
	}


	// GET LOGIN 
	if($ACTION === 'GET_LOGIN'){

		 $usernameCustomer = $_POST['username'];
	 	 $passwordCustomer = $_POST['password'];

		$sql=mysqli_query($conn,"SELECT * FROM customer where name = '$usernameCustomer' and password = '$passwordCustomer'");
		if($sql === FALSE) 
		{
			die(mysqli_error());
		}
		else{
			while($row=mysqli_fetch_assoc($sql))
			$response[]=$row;
			echo json_encode($response);
		}
	}

?>