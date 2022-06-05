{if isset($smarty.session.user)}

    {include file="main/main.tpl"}

{else}
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/css/style.css">
        <title>{block name="title"}Default Title{/block}</title>
    </head>

    <body>

        <fieldset class="border p-3 rounded shadow border-success" style="background-color: #eeeeee;" id="login-field">
            <legend class="border rounded-circle p-3 bg-success"
                style="float:none; width:auto ;margin-left: auto;margin-right: auto;">
                <i class="fa fa-solid fa-user fa-3x text-light"></i>
            </legend>
            {if isset($smarty.session.error)}
                <div class="alert alert-danger border-0 rounded-0 p-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                        class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img"
                        aria-label="Warning:">
                        <path
                            d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                    </svg>
                    {$smarty.session.error}
                </div>
            {/if}
            <form id="loginForm">
                <div class="form-floating mb-3">
                    <input type="text" name="login_user_login" class="form-control my-3" placeholder="prenom" id="logEmail"
                        required>
                    <label for="logEmail" class="required">Email ou pseudo</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" name="login_user_pass" class="form-control my-3" placeholder="prenom"
                        id="logPass" required>
                    <label for="logPass" class="required">Mot de passe</label>
                </div>
                <div class="d-flex flex-row">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">
                            Se souvenir de moi
                        </label>
                    </div>
                    <button type="submit" name="login_submit" formmethod="post" class="btn btn-primary ms-auto px-5"
                        formaction=".">
                        <i class="fa-solid fa-right-to-bracket"></i>
                    </button>
                </div>
            </form>
        </fieldset>

    </body>

    </html>

{/if}