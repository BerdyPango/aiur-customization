<div class="signin-form">
  <div class="container">
    <div class="row">
      <div class="col-sm-7 col-xs-12">
        <div class="panel panel-default">
          <div class="panel-heading">欢迎来到魔兽世界巫妖王之怒公益服务器</div>
          <div class="panel-body">
            <p>
              - 服务器名定为「艾尔」，为公益服务器，旨在为老友提供一个线上聚会的场所<br>
              - 前往 <a href="?p=info">Info</a> 页面了解服务器详情<br>
              - 前往<a href="?p=connect">开始指引</a>了解如何开始<br>
              - 前往<a href="?p=status">服务器状态</a>查看当前在线的小伙伴<br>
              - 服务器由 <a href="https://github.com/TrinityCore/TrinityCore" target="_blank">TrinityCore</a> 驱动，<a href="https://cloud.tencent.com/" target="_blank">腾讯云</a>提供计算及存储<br>
              - 如果在注册或安装过程中遇到任何问题，或有任何建议，请至<a href="https://github.com/BerdyPango/aiur-customization/issues" target="_blank">这里</a>提交</b>
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-8 col-xs-12">
        <div class="mytitle">账号注册:</div>
        <div id="error"></div>
        <div id="success"></div>
        <form action="functions/register.php" class="form-signin" method="POST" id="register-form">
          <div class="form-group">
            <label for="user">用户名: (不支持 Email)</label>
            <input type="text" id="user" class="form-control" name="user" required>
            <span id="check-e"></span>
          </div>
          <div class="form-group">
            <label for="pass">密码:</label>
            <input type="password" id="pass" class="form-control" name="pass" required>
          </div>
          <div class="form-group">
            <label for="pass2">确认密码:</label>
            <input type="password" id="pass2" class="form-control" name="pass2" required>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-default" name="btn-save" id="btn-submit">
              <span class="glyphicon glyphicon-log-in"></span> &nbsp; 新建账号
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
