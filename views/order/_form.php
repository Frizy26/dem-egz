<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Order $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="order-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'start_date')->textInput() ?>

    <?= $form->field($model, 'end_date')->textInput() ?>

    <?= $form->field($model, 'device_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tech_model')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'problem_description')->textarea(['rows' => 6]) ?>

    <?php
    if (!Yii::$app->user->identity->roleMiddleware('client')) {
        echo $form->field($model, 'status_id')->dropDownList(
            \yii\helpers\ArrayHelper::map(app\models\Status::find()->all(), 'id', 'name'),
            ['prompt' => 'Выберите статус']
        );
    }
    ?>


    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'priority_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
