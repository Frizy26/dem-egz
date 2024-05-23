<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "material".
 *
 * @property int $id
 * @property string $name
 * @property float $price
 * @property int $amount
 *
 * @property ReportOrder $reportOrder
 */
class Material extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'material';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'price', 'amount'], 'required'],
            [['price'], 'number'],
            [['amount'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'price' => 'Price',
            'amount' => 'Amount',
        ];
    }

    /**
     * Gets query for [[ReportOrder]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReportOrder()
    {
        return $this->hasOne(ReportOrder::class, ['material_id' => 'id']);
    }
}
