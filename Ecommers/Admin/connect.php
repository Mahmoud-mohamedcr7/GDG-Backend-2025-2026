<?php 
   $dsn = 'mysql:host=localhost;dbname=shops'; 
   $user = 'root';
   $pass = ''; // تأكد أن كلمة المرور فارغة فعلاً في إعدادات السيرفر لديك
   $option = array(
       PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
       PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION 
   );

   try {
       $con = new PDO($dsn, $user, $pass, $option);
       // echo "تم الاتصال بنجاح"; // يمكنك تفعيل هذا السطر للاختبار فقط
      // echo 'you are connected welcome to database';
   }
   catch (PDOException $e) {
       // في حال وجود خطأ، سيطبع لك السبب بالتحديد (مثل اسم قاعدة بيانات خاطئ)
       echo "Faild to connect " . $e->getMessage();
   }
?>