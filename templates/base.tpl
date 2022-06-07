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
    <base href="{$smarty.server.HTTP_HOST}">
    <link rel="stylesheet" href="/assets/css/style.css">
    <title>{block name="title"}Default Title{/block}</title>
</head>

<body>

    <div id="loader-start">
        <div id="loader-in">
            <div class="spinner-border p-5" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>

    <header>

        <nav class="navbar navbar-expand-lg bg-light px-lg-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">
                <i class="fa-solid fa-house"></i>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    {*********** search bar/only large screen***********}
                    <div class="mx-5 d-sm-none" id="headSearch">
                        <form>
                            <div class="input-group shadow">
                                <input class="form-control" type="search" placeholder="Rechercher..."
    aria-label="Search" id="searchControl" name="q" value="{if isset($smarty.get.q)}{$smarty.get.q}{/if}">
                                <button class="btn btn-primary" type="submit" id="searchSubmit" formmethod="get"
                                    formaction="/search"><i class="fa-solid fa-search p-1"></i></button>
                            </div>
                        </form>
                        <div style="height:200px; position:absolute;" class="border w-50"></div>
                    </div>
                    {**********************************}
                    {************* Menu ***************}
                    <ul class="navbar-nav me-auto text-dark" id="navHead">
                        <li class="nav-item mx-auto">
                            <a class="nav-link" href="/offres-de-stage">Offres de stage</a>
                        </li>
                        <li class="nav-item mx-auto">
                            <a class="nav-link" href="/entreprises">Entreprises</a>
                        </li>
                       
                        <li class="nav-item mx-auto">
                            <a class="nav-link" aria-current="page" href="/avis-entreprises">Avis sur les entreprises</a>
                        </li>
                    </ul>
                    {****************************************************************}
                    {*************             Users info           *****************}
                    <div class="d-flex justify-content-end">
                        <ul class="nav mx-auto">
                            <li class="nav-item"><a href="/users/manage" class="nav-link"><i class="fa-solid fa-list-check text-dark"></i></a></li>
                            <li class="nav-item"><a href="/create" class="nav-link"><i class="fa-solid fa-circle-plus text-dark"></i></a></li>
                            <li class="nav-item"><a href="/users/notif" class="nav-link"><i class="fa-solid fa-bell text-dark"></i></a></li>
                            <li class="nav-item">
                            {***************user menu ***************}
                                <div class="btn-group">
                                    <a role="button" class="nav-link" id="dropdownUserbtn" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user text-dark"></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end rounded-0 border-0 mt-2 " aria-labelledby="dropdownUserbtn">
                                        <li><a class="dropdown-item border-bottom" href="/users/profil">Profil</a></li>
                                        <li><a class="dropdown-item border-bottom" href="/candidatures">Mes candidatures</a></li>
                                        <li><a class="dropdown-item border-bottom" href="/wish-list">Wish List</a></li>
                                        <li><a class="dropdown-item border-bottom" href="/main/logout">Deconnexion</a></li>
                                    </ul>
                                </div>
                            {******************************}
                            </li>
                        </ul>
                    </div>
                    {****************************************************************}
                    
                </div>
            </div>
        </nav>

    </header>

    <main class="container">
        {block name="content"}default Content{/block}
    </main>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/assets/js/main.js"></script>
</body>

</html>