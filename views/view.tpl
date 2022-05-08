<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body> 
    {{if !isset($smarty.session.status)}}
    <div class="login">
        <p>connexion</p>
    </div>
    {{else}}
        {********************************************}
        {{include file_name="templates/header.tpl"}}
    {{/if}}
</body>
</html>