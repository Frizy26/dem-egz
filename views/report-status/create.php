<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\ReportStatus $model */

$this->title = 'Create Report Status';
$this->params['breadcrumbs'][] = ['label' => 'Report Statuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="report-status-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
