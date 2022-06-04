<p>aziz - Annonces</p>
<?php foreach ($annonces as $annonce) : ?>
    <article>
        <a href="/annonce/lire/<?= $annonce->id ?>"><?= $annonce->titre ?></a>
        <p>
            <?= $annonce->description ?>
        </p>
    </article>
<?php endforeach; ?>