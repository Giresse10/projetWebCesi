<div class="form-group bg-secondary w-50 p-3 rounded">
    <form id="loginForm" action=".">
        <div class="form-floating mb-3">
          <input type="email" name="login_user_login" class="form-control my-3"  placeholder="prenom" id="logEmail" required>
          <label for="logEmail" class="required">Email</label>
        </div>
        <div class="form-floating mb-3">
          <input type="password" name="login_user_pass" class="form-control my-3"  placeholder="prenom" id="logPass" required>
          <label for="logPass" class="required">Mot de passe</label>
        </div>
        <div class="d-flex flex-row">
          <input type="submit" name="login_submit" formmethod="post" class="btn btn-outline-primary ms-auto px-5" value="Connexion">
        </div>
    </form>
</div>