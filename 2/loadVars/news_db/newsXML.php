<?php
	$action = $_GET["action"];

	$t1 = urldecode($_POST["t1"]);
	$t2 = urldecode($_POST["t2"]);
	$t3 = urldecode($_POST["t3"]);
	$t4 = urldecode($_POST["t4"]);


	if ($action==1) { // вынимаем из БД
		$link = mysql_connect("localhost", "root", "");
		mysql_select_db ("news");
		$str = "SELECT * FROM lenta";
		$rez = mysql_query($str);
		echo '<'.'?xml version="1.0" encoding="windows-1251"?'.'>';
		echo "<flashxml>\n";
		while ($oneline = mysql_fetch_array($rez)) {
			$i++;
			echo '	<message id="'.$oneline["id"].'" ';
			echo 'title="'.urlencode($oneline["title"]).'" ';
			echo 'author="'.urlencode($oneline["author"]).'" ';
			echo 'image="'.$oneline["image"].'" >';
			echo 'dateof="'.$oneline["dateof"].'"   >';
			echo urlencode($oneline["msg"]) . "\n	</message>\n";
		}
		echo "</flashxml>\n";
		mysql_free_result($rez);
		mysql_close($link);

	} else if ($action==2) { // помещаем в БД
		if ($t1!="" && $t2!="" && $t3!="" && $t4!="") {

			$link = mysql_connect("localhost", "root", "");
			mysql_select_db ("news");
			$str = "INSERT INTO lenta (msg, title, author, image, dateof) VALUE ('$t1', '$t2', '$t3', '$t4', NOW() )";
			$rez = mysql_query($str);
			if ($rez === true) echo "err=Данные помещены в БД";
				else echo "err=Неизвестная ошибка";
			mysql_close($link);
		} else echo "err=Недостаточно данных";


	} else {
		echo "err=Неизвестный параметр";
	}

?>