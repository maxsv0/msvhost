<form class="form-horizontal" method="POST" action="/login/">
  <div class="form-group">
    <label for="inputEmail" class="col-sm-4 control-label">{_t("users.form.email")}</label>
    <div class="col-sm-8">
      <input type="email" class="form-control" id="inputEmail" placeholder="{_t("users.form.email")}" name="email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword" class="col-sm-4 control-label">{_t("users.form.password")}</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="inputPassword" placeholder="{_t("users.form.password")}" name="password">
      <div class="checkbox">
        <label>
          <input type="checkbox" checked> {_t("users.form.remember_me")}
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-12 text-center">
      <button type="submit" class="btn btn-primary btn-msvhost-form" name="doLogin" value="1">{_t("users.form.sign_in")}</button>
    </div>
  </div>

</form>

<div class="row">
<div class="col-sm-6 text-center lead">
<p><a class="" href="/signup/">Sign Up</span></p>
<p><a href="/password-reset/">{_t("users.form.link_forget")}</a>         	</p>
</div>
<div class="col-sm-6 text-center">
<a href="{$user_auth_url}" role="button"><img src="/content/images/sign-in-google.png" width="191"></a>
</div>
</div>