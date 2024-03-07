import { faCheckCircle, faSync } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import classNames from 'classnames/bind';
import Button from 'src/components/button/button';
import styles from 'src/page/sync-monitoring/sync-monitoring.module.scss';
import extrData from 'src/page/sync-monitoring/Get_Schd_Prod_Extr_Tasks_Lst.json';
import pouchData from 'src/page/sync-monitoring/Get_Schd_Prod_Pouch_Tasks_List.json';
import slitData from 'src/page/sync-monitoring/Get_Schd_Prod_Slit_Tasks_List.json';
import axios from 'axios';
import { useState } from 'react';
const cx = classNames.bind(styles);
const linkPostTask = `http://192.168.109.25:7048/BC220/ODataV4/Company('CRONUS%20USA%2C%20Inc.')/extrTaskAPI`;
const linkUpdate = `http://192.168.109.25:7048/BC220/ODataV4/NAVService_Update_Task_Status?company=CRONUS USA, Inc.`;

function createSqlInsert(data: any) {
  data['value'].forEach((obj: any) => {
    const renameObj = Object.fromEntries(
      Object.entries(obj).map(([key, value]) => {
        if (key === 'SFT_Display_Order') {
          return ['id', value];
        }
        return [key, value];
      })
    );

    const filteredObj = Object.fromEntries(
      Object.entries(renameObj).filter(([key]) =>
        sft_cln.map((e) => e.toLowerCase()).includes(key.toLowerCase())
      )
    );
    const columns = Object.keys(filteredObj)
      .map((col) => '`' + col + '`')
      .join(', ');
    const values = Object.values(filteredObj);
    const query = `INSERT INTO tbl_job_detail (${columns}) VALUES (${values
      .map((val) => "'" + val + "'")
      .join(', ')});`;
    console.log(query);
    axios.post('http://192.168.109.42:4000/api/sync-bc', { query });
  });
}
const list_rmv = [
  'Last_Modified_Date',
  'Last_Modified_Time',
  'Creation_Date',
  'Due_Date',
  'Expected_Due_Date',
  '@odata.etag',
  'SystemId',
];

const updateAction = (no: any, status: any) => {
  console.log(no, status);

  const updateJson = { inputJson: JSON.stringify({ Prod_Order_No: no, Task_Status: status }) };

  axios.post(linkUpdate, updateJson);
};

const SyncMonitoringPage = () => {
  const [no, setNo] = useState('105769');
  const [status, setStatus] = useState('success');
  const [dData, setDData] = useState([]);
  const getExtrTask = () => {
    axios.get(linkPostTask).then((res) => {
      setDData(res.data);
    })
  };
  return (
    <div className={cx('container')}>
      <div className={cx('card-detail')}>
        <div className={cx('title')}>
          <h1> Dynamic 365 Business Central Sync Status</h1>
          <div className={cx('sync-status')}>SUCCESSFULL</div>
        </div>
        Your data has been successfully synced.
        <Button
          text='Get Data'
          width='200px'
          // blue
          height='50px'
          margin='20px 0 20px 0 '
          onClick={() => {
            getExtrTask();
          }}
        />
        <Button
          text='Sync Again'
          width='200px'
          blue
          height='50px'
          onClick={() => {
            createSqlInsert(extrData);
          }}
        />
        <input
          type='text'
          value={no}
          onChange={(e) => {
            setNo(e.target.value);
          }}
        />
        <input
          type='text'
          value={status}
          onChange={(e) => {
            setStatus(e.target.value);
          }}
        />
        <Button
          text='Update'
          width='200px'
          red
          height='50px'
          margin='20px 0 0 0'
          onClick={() => {
            updateAction(no, status);
          }}
        />
      </div>
      <div className={cx('card-detail')}>
        <h1>Call api manualy</h1>

        <a href="http://acca-dynbcdev01.api.local:7048/BC220/ODataV4/Company('CRONUS%20USA%2C%20Inc.')/Get_Schd_Prod_Extr_Tasks_Lst">
          Get_Schd_Prod_Extr_Tasks_Lst
        </a>
      </div>

      <div className={cx('card-detail')}>
        <div>
          <FontAwesomeIcon icon={faSync} className={cx('icon')} />
          DATA SYNC DETAILS
        </div>

        <div>
          <FontAwesomeIcon
            icon={faCheckCircle}
            className={cx(['icon', 'success'])}
          />
          Last data sync attempt:
          <i className={cx('time')}>{new Date().toLocaleString()}</i>
        </div>
        <div>
          <FontAwesomeIcon
            icon={faCheckCircle}
            className={cx(['icon', 'success'])}
          />
          Last change:
          <i className={cx('time')}>{new Date().toLocaleString()}</i>
        </div>
      </div>
    </div>
  );
};

const sft_cln = [
  'id',
  'Prod_Order_No',
  'Prod_Order_Line_No',
  'Operation_No',
  'machine_type',
  'machine_center_code',
  'machine_center_name',
  'work_center_code',
  'step_width',
  'order_no',
  'is_completed',
  'is_suspended',
  'is_disabled',
  'is_art_approved',
  'is_trial',
  'is_trial_approved',
  'mounted',
  'plate_status',
  'trial_issues',
  'art_issues',
  'art_approved_date',
  'art_approved_by',
  'trial_approved_by',
  'trial_approved_date',
  'is_last_step',
  'is_complete_approved',
  'complete_approved_by',
  'complete_approved_date',
  'Combo_No',
  'press_art',
  'last_order_no',
  'new_machine_center',
  'art_approved_by_api',
  'trial_approved_by_api',
  'sample_required',
  'csr_required',
  'csr_required_approved',
  'csr_required_quantity',
  'csr_required_uom',
  'csr_required_dept',
  'csr_approved_by',
  'csr_approved_by_api',
  'csr_approved_date',
  'marketing_required',
  'marketing_required_approved',
  'marketing_required_quantity',
  'marketing_required_uom',
  'marketing_required_dept',
  'marketing_approved_by',
  'marketing_approved_by_api',
  'marketing_approved_date',
  'suspended_from',
  'suspended_by',
  'suspended_date',
  'reschedule_to',
  'reschedule_issues',
  'is_rescheduled',
  'graphic_status',
  'is_restarted',
  'created_date',
  'completed_from',
  'completed_by',
  'completed_date',
  'is_archived',
  'archived_date',
  'Next_Operation_No',
  'Previous_to_Suspend_No',
  'SFT_Status',
  'Task_Status',
  'Fixed_Scrap_Quantity_FEET',
  'Fixed_Scrap_Quantity',
  'Scrap_Factor',
  'Input_Quantity_FEET',
  'Input_Quantity',
  'Output_Quantity',
  'Output_Quantity_FEET',
  'Expected_Capacity_Need_Mins',
  'Routing_Status',
  'Production_UOM',
  'Remaining_Quantity',
  'V2UOM_Remaining_Qty',
  'Quantity',
  'V2UOM_Quantity',
  'Trial',
  'Graphic_No',
  'Film_Structure',
  'Treat',
  'Hot_Job',
  'COA',
  'Gauge',
  'Web_Width',
  'Long_Description',
  'Customer_Part_No',
  'Accredo_Part_No',
  'Qty_Ordered',
  'Qty_Ordered_UOM',
  'Folded_Width',
  'Folder_Wind',
  'VFold_Dusting',
  'VFold_Dusting_Perc',
  'Customer_Samples_Requested',
  'CSR_Quantity',
  'CSR_UOM',
  'CSR_Department',
  'Marketing_Samples_Requested',
  'MSR_Quantity',
  'MSR_UOM',
  'MSR_Department',
  'FGS_Syncronized',
  'Customer_PO_No',
  'Creation_Date',
  'Due_Date',
  'AuxiliaryIndex1',
  'AuxiliaryIndex2',
  'AuxiliaryIndex3',
  'AuxiliaryIndex4',
  'AuxiliaryIndex5',
  'AuxiliaryIndex6',
  'AuxiliaryIndex7',
  'AuxiliaryIndex8',
  'Type_FilterOnly',
  'Machine_Center_No_FilterOnly',
  'Work_Center_No_FilterOnly',
  'Previous_to_Suspend_No_Filter_FilterOnly',
  'job_id',
  'press_art_short',
  'last_status_time',
  'Production_Status_Code',
  'Production_Status',
  'Production_Moment',
  'Production_Status_Detail',
  'Required_Quantity',
  'Est_Hours',
  'FT_Qty__Left_to_Make',
  'info_separator',
  'info_contact',
  'row_class',
  'sample_required_qty',
  'sample_required_popup_title',
  'sample_required_approved',
  'Customer_Name',
  'Percent_Completed',
  'actions',
  'Actual_Output_Qty',
  'V2UOM_Actual_Qty',
  'GC',
  'Printed_Structure',
  'Printed_Rewind',
  'Printed_No_Across_FGS',
  'Printed_Around',
  'Printed_Repeat',
  'Printed_Color',
  'Printed_Sleeve',
  'Impression_per_Finished_Web',
  'gos_status_approved_files_date',
  'Prod_Order_Line',
  'Item_No',
  'Output_Width',
  'Prod_Target_Gauge',
  'Trim',
  'Treated',
  'Bubble_Width',
  'FT_Total_Qty_to_Make',
  'No_of_Layers',
  'Code',
  'Color',
  'Treat_Target',
  'Treat_Range',
  'Lam_Top_Film_Type',
  'Lam_Top_Gauge',
  'Lam_Top_Width',
  'Lam_Middle_Web_Film_Type',
  'Lam_Middle_Web_Gauge',
  'Lam_Middle_Web_Width',
  'Lam_Back_Sheet_Film_Type',
  'Lam_Back_Sheet_Gauge',
  'Lam_Back_Sheet_Width',
  'Lam_Wind_1',
  'Lam_Wind_2',
  'Slitting_Width',
  'Slitting_AC',
  'Slitting_Wind',
  'Slitting_Dusting',
  'Slitting_Dusting_Perc',
  'Wckt_Lay_Flat_Width',
  'Wckt_Zipper',
  'Wckt_Location_from_top',
  'Wckt_Height_of_Bags',
  'Wckt_Width_of_Bags',
  'Wckt_Flip',
  'Wckt_Bottom_Gusset',
  'Wckt_Handle_Punch',
  'Wckt_Perforation',
  'Wckt_Perforation_Location',
  'Wckt_Venting',
  'Wckt_Venting_Location',
  'Wckt_Tie_Links',
  'Wckt_Tie_Links_Location',
  'Wckt_No_Of_Holes',
  'Wckt_Washer',
  'Wckt_Cards',
  'Wckt_Wicket',
  'Wckt_Wicket_Type',
  'Wckt_Wicket_Direction',
  'Wckt_Wicket_Width',
  'Wckt_Wicket_Length',
  'Wckt_Wicket_Item',
  'Wckt_Bags_per_Wicket',
  'Pouch_Height',
  'Pouch_Width',
  'Pouch_Bottom_Gusset',
  'Pouch_Wicket',
  'Pouch_Tear_Notch',
  'Pouch_Handle',
  'Pouch_Vent_Hole',
  'Pouch_Zipper',
  'Film_Type',
  'Combo_No2',
  'Combo_No_FilterOnly',
  'Prod_Order_No_F_FilterOnly',
  'Input_Quantity_UOM',
  'Routing_Steps',
  'Print_Colours',
  'FEET_Actual_Qty',
  'Last_Date_Modified',
  'Number_Across',
  'FT_Qty__Left_to_Make_Unit',
  'Qty_Ordered_Unit',
  'Required_Quantity_Unit',
  'Machine_Center_No2',
  'reopen_issues',
  'is_deleted',
  'Production_Status_en',
  'Production_Status_vi',
  'hours_est',
  'Quantity_Run',
  'Last_Modified_Date',
  'Last_Modified_Time',
  'Last_Modified_Date_Filter_FilterOnly',
  'Last_Modified_Time_Filter_FilterOnly',
  'sample_required_detail_csr',
  'sample_required_detail_msr',
  'note',
  'is_splitter',
  'job_jacket',
  'Slitting_Laser_Vents',
  'plate_type',
  'break_in_fee',
  'Authorization_No',
  'instruction_to_operator',
  'Remaining_Qty_Base',
  'Line_No2',
  'Variant_Code',
  'Description',
  'Unit_of_Measure_Code',
  'Quantity_Base',
  'Job_Specification_No',
  'Printed_Across_No',
  'Slitting_Across_No',
  'Imp_Per_Finished_Web',
  'Line_No_FilterOnly',
  'FG_Lanes_Across',
  'Printed_Number_Across_FGS',
  'Finished_Quantity',
  'V2UOM_Finished_Qty',
  'schedule_color_icon',
  'schedule_color_note_id',
  'is_created',
  'press_color_exactly',
  'press_color_1',
  'press_color_2',
  'press_color_3',
  'press_color_4',
  'press_color_5',
  'press_color_6',
  'press_color_7',
  'press_color_8',
  'press_color_9',
  'press_color_10',
  'film_staging',
  'Rewinder_Wind',
  'mrms',
  'combo_ext',
  'press_cs_color_1',
  'press_cs_color_2',
  'press_cs_color_3',
  'press_cs_color_4',
  'press_cs_color_5',
  'press_cs_color_6',
  'press_cs_color_7',
  'press_cs_color_8',
  'press_cs_color_9',
  'press_cs_color_10',
  'press_cs_color_exactly',
  'Lanes_Across',
  'Previous_Operation_No',
  'Pouch_Laser_Score',
  'Last_Modified_Date_Time',
  'Prod_Order_No_Operation_No',
  'Expected_Due_Date',
  'graphic_pdf',
  'graphic_pdf_completed',
  'graphic_proof',
  'graphic_proof_completed',
  'graphic_len_file',
  'graphic_len_file_completed',
  'trial_type',
  'film_plan',
  'film_plan_data',
  'purple_line',
  'is_hold_trial',
  'hold_reason',
  'is_qc_trial',
  'qc_trial_by',
  'qc_trial_date',
  'shipped_date',
  'unhold_reason',
  'Adj_Input_Qty_FEET',
  'Adj_Output_Qty_FEET',
  'Inno_Lok_Op_Ref_Link',
  'Is_Inno_Lok_Zipper',
  'Inno_Lok_UOM',
  'Inno_Lok_Zipper_Length',
  'Inno_Lok_Loc_from_top_of_Imp',
  'Inno_Lok_Loc_from_edge_of_Imp',
  '__deleted',
  'weight_of_extra_plates',
];

export default SyncMonitoringPage;
const PostDataTest = () => {
  pouchData['value'].forEach((obj: any) => {
    const newObj = Object.fromEntries(
      Object.entries(obj)
        .filter(([key]) => !list_rmv.includes(key))
        .map(([key, value]) => [key.replace(/_/g, ''), value])
    );
    axios.post(linkPostTask, newObj);
  });
};
