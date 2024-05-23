<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "report_order".
 *
 * @property int $id
 * @property float $price
 * @property int $material_id
 * @property int $order_id
 * @property int $report_status_id
 *
 * @property Material $material
 * @property Order $order
 * @property ReportStatus $reportStatus
 */
class ReportOrder extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'report_order';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['price', 'material_id', 'order_id', 'report_status_id'], 'required'],
            [['price'], 'number'],
            [['material_id', 'order_id', 'report_status_id'], 'integer'],
            [['material_id'], 'unique'],
            [['order_id'], 'unique'],
            [['report_status_id'], 'unique'],
            [['material_id'], 'exist', 'skipOnError' => true, 'targetClass' => Material::class, 'targetAttribute' => ['material_id' => 'id']],
            [['order_id'], 'exist', 'skipOnError' => true, 'targetClass' => Order::class, 'targetAttribute' => ['order_id' => 'id']],
            [['report_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => ReportStatus::class, 'targetAttribute' => ['report_status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'price' => 'Price',
            'material_id' => 'Material ID',
            'order_id' => 'Order ID',
            'report_status_id' => 'Report Status ID',
        ];
    }

    /**
     * Gets query for [[Material]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMaterial()
    {
        return $this->hasOne(Material::class, ['id' => 'material_id']);
    }

    /**
     * Gets query for [[Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(Order::class, ['id' => 'order_id']);
    }

    /**
     * Gets query for [[ReportStatus]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReportStatus()
    {
        return $this->hasOne(ReportStatus::class, ['id' => 'report_status_id']);
    }
}
