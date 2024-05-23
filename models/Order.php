<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "order".
 *
 * @property int $id
 * @property string $start_date
 * @property string|null $end_date
 * @property string $device_type
 * @property string $tech_model
 * @property string $problem_description
 * @property int $status_id
 * @property int|null $user_id
 * @property int $priority_id
 *
 * @property Comment[] $comments
 * @property Priority $priority
 * @property ReportOrder $reportOrder
 * @property Status $status
 * @property User $user
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['start_date', 'device_type', 'tech_model', 'problem_description', 'status_id', 'priority_id'], 'required'],
            [['start_date', 'end_date'], 'safe'],
            [['problem_description'], 'string'],
            [['status_id', 'user_id', 'priority_id'], 'integer'],
            [['device_type', 'tech_model'], 'string', 'max' => 255],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => Status::class, 'targetAttribute' => ['status_id' => 'id']],
            [['priority_id'], 'exist', 'skipOnError' => true, 'targetClass' => Priority::class, 'targetAttribute' => ['priority_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'device_type' => 'Device Type',
            'tech_model' => 'Tech Model',
            'problem_description' => 'Problem Description',
            'status_id' => 'Status ID',
            'user_id' => 'User ID',
            'priority_id' => 'Priority ID',
        ];
    }

    /**
     * Gets query for [[Comments]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::class, ['order_id' => 'id']);
    }

    /**
     * Gets query for [[Priority]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPriority()
    {
        return $this->hasOne(Priority::class, ['id' => 'priority_id']);
    }

    /**
     * Gets query for [[ReportOrder]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReportOrder()
    {
        return $this->hasOne(ReportOrder::class, ['order_id' => 'id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Status::class, ['id' => 'status_id']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }
}
