<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\ReportOrder $model */

$this->title = 'Create Report Order';
$this->params['breadcrumbs'][] = ['label' => 'Report Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="report-order-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
