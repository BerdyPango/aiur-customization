<?php
function getplayercount() {
  include('config/dbconf.php');

  $online = 1;

  mysqli_select_db($conn, $chardb);
  $stmt = $conn->prepare("SELECT * FROM characters WHERE online = ?");
  $stmt->bind_param("i", $online);
  $stmt->execute();
  $stmt->store_result();
  if($stmt->num_rows > 0) {
    echo $stmt->num_rows;
  }else{
    echo 0;
  }
}

function getonlineplayers() {
  include('config/dbconf.php');

  $online = 1;

  mysqli_select_db($conn, $chardb);
  $stmt = $conn->prepare("SELECT name, race, class, level, gender FROM characters WHERE online = ?");
  $stmt->bind_param("i", $online);
  $stmt->execute();
  $stmt->bind_result($name, $race, $class, $level, $gender);
  $stmt->store_result();
  if($stmt->num_rows > 0) {
    while($stmt->fetch()) {
      switch($class) {
        case"1":
        $colorname = "<font color='C79C6E'>$name</font>";
        break;

        case"2":
        $colorname = "<font color='F58CBA'>$name</font>";
        break;

        case"3":
        $colorname = "<font color='ABD473'>$name</font>";
        break;

        case"4":
        $colorname = "<font color='FFF569'>$name</font>";
        break;

        case"5":
        $colorname = "<font color='FFFFFF'>$name</font>";
        break;

        case"6":
        $colorname = "<font color='C41F3B'>$name</font>";
        break;

        case"7":
        $colorname = "<font color='0070DE'>$name</font>";
        break;

        case"8":
        $colorname = "<font color='69CCF0'>$name</font>";
        break;

        case"9":
        $colorname = "<font color='9482C9'>$name</font>";
        break;

        case"11":
        $colorname = "<font color='FF7D0A'>$name</font>";
        break;
      }

      switch($class) {
        case"1":
        $class = "<img src='images/icons/class_warrior.gif' title='Warrior' alt='class'>";
        break;

        case"2":
        $class = "<img src='images/icons/class_paladin.gif' title='Paladin' alt='class'>";
        break;

        case"3":
        $class = "<img src='images/icons/class_hunter.gif' title='Hunter' alt='class'>";
        break;

        case"4":
        $class = "<img src='images/icons/class_rogue.gif' title='Rogue' alt='class'>";
        break;

        case"5":
        $class = "<img src='images/icons/class_priest.gif' title='Priest' alt='class'>";
        break;

        case"6":
        $class = "<img src='images/icons/class_deathknight.gif' title='Death Knight' alt='class'>";
        break;

        case"7":
        $class = "<img src='images/icons/class_shaman.gif' title='Shaman' alt='class'>";
        break;

        case"8":
        $class = "<img src='images/icons/class_mage.gif' title='Mage' alt='class'>";
        break;

        case"9":
        $class = "<img src='images/icons/class_warlock.gif' title='Warlock' alt='class'>";
        break;

        case"11":
        $class = "<img src='images/icons/class_druid.gif' title='Druid' alt='class'>";
        break;
      }

      switch($race) {
        case"1":
        $racename = "Human";
        if($gender == 0) {
          $race = "<img src='images/icons/race_human_male.gif' title='Human Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_human_female.gif' title='Human Female' alt='race'>";
        }
        break;

        case"2":
        $racename = "Orc";
        if($gender == 0) {
          $race = "<img src='images/icons/race_orc_male.gif' title='Orc Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_orc_female.gif' title='Orc Female' alt='race'>";
        }
        break;

        case"3":
        $racename = "Dwarf";
        if($gender == 0) {
          $race = "<img src='images/icons/race_dwarf_male.gif' title='Dwarf Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_dwarf_female.gif' title='Dwarf Female' alt='race'>";
        }
        break;

        case"4":
        $racename = "Night-Elf";
        if($gender == 0) {
          $race = "<img src='images/icons/race_nightelf_male.gif' title='Night-Elf Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_nightelf_female.gif' title='Night-Elf Female' alt='race'>";
        }
        break;

        case"5":
        $racename = "Undead";
        if($gender == 0) {
          $race = "<img src='images/icons/race_undead_male.gif' title='Undead Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_undead_female.gif' title='Undead Female' alt='race'>";
        }
        break;

        case"6":
        $racename = "Tauren";
        if($gender == 0) {
          $race = "<img src='images/icons/race_tauren_male.gif' title='Tauren Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_tauren_female.gif' title='Tauren Female' alt='race'>";
        }
        break;

        case"7":
        $racename = "Gnome";
        if($gender == 0) {
          $race = "<img src='images/icons/race_gnome_male.gif' title='Gnome Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_gnome_female.gif' title='Gnome Female' alt='race'>";
        }
        break;

        case"8":
        $racename = "Troll";
        if($gender == 0) {
          $race = "<img src='images/icons/race_troll_male.gif' title='Troll Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_troll_female.gif' title='Troll Female' alt='race'>";
        }
        break;

        case"10":
        $racename = "Blood-Elf";
        if($gender == 0) {
          $race = "<img src='images/icons/race_bloodelf_male.gif' title='Blood-Elf Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_bloodelf_female.gif' title='Blood-Elf Female' alt='race'>";
        }
        break;

        case"11":
        $racename = "Draenei";
        if($gender == 0) {
          $race = "<img src='images/icons/race_draenei_male.gif' title='Draenei Male' alt='race'>";
        }elseif($gender == 1){
          $race = "<img src='images/icons/race_draenei_female.gif' title='Draenei Female' alt='race'>";
        }
        break;
      }

      if($racename == "Tauren" || $racename == "Blood-Elf" || $racename == "Undead" || $racename == "Troll" || $racename == "Orc") {
        $faction = "<img src='images/icons/faction_horde.gif' title='Horde' alt='Faction'>";
      }else{
        $faction = "<img src='images/icons/faction_alliance.gif' title='Alliance' alt='Faction'>";
      }
      echo "<tr>";
      echo "<td>$colorname</td>";
      echo "<td>$class</td>";
      echo "<td>$race</td>";
      echo "<td>$level</td>";
      echo "<td>$faction</td>";
      echo "</tr>";
    }
  }
}
?>
<div class="signin-form">
  <div class="container">
    <div class="row">
      <div class="col-sm-7 col-xs-12">
        <div class="panel panel-default">
          <div class="panel-heading">服务器状态</div>
          <div class="panel-body">
            <div class="progress">
              <div class="progresstext"><?php echo getplayercount(); ?>/100 名玩家</div>
              <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="<?php echo getplayercount(); ?>" aria-valuemin="0" aria-valuemax="100" style="width:<?php echo getplayercount(); ?>%">
              </div>
            </div>
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th colspan="5">
                      <center>
                        <?php
                        exec('ps -a | grep "worldserver"', $output);
                        if(empty($output)) {
                          echo "服务器 <font color='ff0000'>离线</font>";
                        }else{
                          echo "服务器 <font color='00ff00'>在线</font>";
                        }
                        ?>
                      </center>
                    </th>
                  </tr>
                  <tr>
                    <th>角色名字</th>
                    <th>职业</th>
                    <th>种族</th>
                    <th>等级</th>
                    <th>阵营</th>
                  </tr>
                </thead>
                <tbody>
                  <?php echo getonlineplayers(); ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
