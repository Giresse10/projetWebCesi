<?php if(isset($s)):if($s): ?>
<div class="alert alert-success">
succès
</div>
<?php else : ?>
<div class="alert alert-danger">
erreur
</div>
<?php endif;endif;?>
<div class="w-75 mx-auto mt-5 border shadow p-2 rounded">
    <h2>creer un compte</h2>
    <?= $f ?>

</div>