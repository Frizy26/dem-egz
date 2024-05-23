<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "report_status".
 *
 * @property int $id
 * @property string $name
 *
 * @property ReportOrder $reportOrder
 */
class ReportStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'report_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
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
        ];
    }

    /**
     * Gets query for [[ReportOrder]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReportOrder()
    {
        return $this->hasOne(ReportOrder::class, ['report_status_id' => 'id']);
    }
}
