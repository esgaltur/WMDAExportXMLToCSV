unit uTags;
 {
  Copyright 2020 Dmitriy Sosnovich, dmitriy@sosnovich.com

  Permission is hereby granted, free of charge,
  to any person obtaining a copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense,
  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.}
interface
const
cEmptyTag = 'Empty_Tag'  ;
cEmptyAttr = 'Empty_Attr'  ;
cInventoryTag = 'INVENTORY';
cDonorTag = 'DONOR';
cCBUTag = 'CBU';
 cTagsXPathList: array of string = ['GRID',
 'ATTR',
 'BIRTH_DATE',
 'SEX',
 'ABO',
 'RHESUS',
 'ETHN',
 'CCR5',
 'HLA',
 'KIR',
 'IDM',
 'RSV_PAT',
 'STATUS',
 'STAT_END_DATE',
 'STAT_REASON',
 'CONTACT_DATE',
 'CHECKUP_DATE',
 'WEIGHT',
 'HEIGHT',
 'NMBR_TRANS',
 'NMBR_PREG',
 'NMBR_MARR',
 'NMBR_PBSC',
 'COLL_TYPE',
 'LOCAL_ID',
 'BAG_ID',
 'COLL_DATE',
 'PROC_DATE',
 'PROC_METH',
 'PROC_METH_TYPE',
 'FREEZE_DATE',
 'FREEZE_METH',
 'PROD_MOD',
 'BAG_TYPE',
 'BAGS',
 'BACT_CULT',
 'FUNG_CULT',
 'HEMO_STATUS',
 'VOL',
 'VOL_FRZN',
 'TNC',
 'TNC_FRZN',
 'RED_BC_FRZN',
 'MNC_FRZN',
 'CD34PC',
 'CD34PC_FRZN',
 'CFU_FRZN',
 'VIABILITY',
 'VIABILITY_DATE',
 'VIABILITY_CELLS',
 'VIABILITY_METHOD',
 'ATT_SEG',
 'DNA_SMPL',
 'OTH_SMPL',
 'CT_COMPLETE_DATE',
 'CT_SMPL_TYPE',
 'AL_RED_BC',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'ID',
 'MAT_ID',
 'MAT_ID_BANK',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'IDM/CMV',
 'IDM/CMV_NAT',
 'IDM/CMV_DATE',
 'IDM/HBS_AG',
 'IDM/ANTI_HBC',
 'IDM/ANTI_HBS',
 'IDM/ANTI_HCV',
 'IDM/ANTI_HIV_12',
 'IDM/HIV_1_NAT',
 'IDM/HIV_P24',
 'IDM/HCV_NAT',
 'IDM/ANTI_HTLV',
 'IDM/SYPHILIS',
 'IDM/WNV',
 'IDM/CHAGAS',
 'IDM/EBV',
 'IDM/TOXO',
 'IDM/HBV_NAT',
 'IDM/PB19_NAT',
 'IDM/ALT',
 'MAT/IDM/CMV',
 'MAT/IDM/CMV_NAT',
 'MAT/IDM/CMV_DATE',
 'MAT/IDM/HBS_AG',
 'MAT/IDM/ANTI_HBC',
 'MAT/IDM/ANTI_HBS',
 'MAT/IDM/ANTI_HCV',
 'MAT/IDM/ANTI_HIV_12',
 'MAT/IDM/HIV_1_NAT',
 'MAT/IDM/HIV_P24',
 'MAT/IDM/HCV_NAT',
 'MAT/IDM/ANTI_HTLV',
 'MAT/IDM/SYPHILIS',
 'MAT/IDM/WNV',
 'MAT/IDM/CHAGAS',
 'MAT/IDM/EBV',
 'MAT/IDM/TOXO',
 'MAT/IDM/HBV_NAT',
 'MAT/IDM/PB19_NAT',
 'MAT/IDM/ALT',
 'KIR/KIR2DL1',
 'KIR/KIR2DL2',
 'KIR/KIR2DL3',
 'KIR/KIR2DL4',
 'KIR/KIR2DL5A',
 'KIR/KIR2DL5B',
 'KIR/KIR2DS1',
 'KIR/KIR2DS2',
 'KIR/KIR2DS3',
 'KIR/KIR2DS4',
 'KIR/KIR2DS5',
 'KIR/KIR2DP1',
 'KIR/KIR3DL1',
 'KIR/KIR3DL2',
 'KIR/KIR3DL3',
 'KIR/KIR3DS1',
 'KIR/KIR3DP1',
 'KIR/KIR_GL',
 'HLA/A/SER/FIELD1',
 'HLA/A/SER/FIELD2',
 'HLA/A/DNA/FIELD1',
 'HLA/A/DNA/FIELD2',
 'HLA/B/SER/FIELD1',
 'HLA/B/SER/FIELD2',
 'HLA/B/DNA/FIELD1',
 'HLA/B/DNA/FIELD2',
 'HLA/C/SER/FIELD1',
 'HLA/C/SER/FIELD2',
 'HLA/C/DNA/FIELD1',
 'HLA/C/DNA/FIELD2',
 'HLA/DRB1/SER/FIELD1',
 'HLA/DRB1/SER/FIELD2',
 'HLA/DRB1/DNA/FIELD1',
 'HLA/DRB1/DNA/FIELD2',
 'HLA/DRB3/DNA/FIELD1',
 'HLA/DRB3/DNA/FIELD2',
 'HLA/DRB4/DNA/FIELD1',
 'HLA/DRB4/DNA/FIELD2',
 'HLA/DRB5/DNA/FIELD1',
 'HLA/DRB5/DNA/FIELD2',
 'HLA/DQA1/DNA/FIELD1',
 'HLA/DQA1/DNA/FIELD2',
 'HLA/DQB1/SER/FIELD1',
 'HLA/DQB1/SER/FIELD2',
 'HLA/DQB1/DNA/FIELD1',
 'HLA/DQB1/DNA/FIELD2',
 'HLA/DQB1/DNA/FIELD1',
 'HLA/DPA1/DNA/FIELD1',
 'HLA/DPA1/DNA/FIELD2',
 'HLA/DPB1/DNA/FIELD1',
 'HLA/DPB1/DNA/FIELD2',
 'MAT/HLA/A/SER/FIELD1',
 'MAT/HLA/A/SER_FIELD2',
 'MAT/HLA/A/DNA/FIELD1',
 'MAT/HLA/A/DNA/FIELD2',
 'MAT/HLA/B/SER/FIELD1',
 'MAT/HLA/B/SER/FIELD2',
 'MAT/HLA/B/DNA/FIELD1',
 'MAT/HLA/B/DNA/FIELD2',
 'MAT/HLA/C/SER/FIELD1',
 'MAT/HLA/C/SER/FIELD2',
 'MAT/HLA/C/DNA/FIELD1',
 'MAT/HLA/C/DNA/FIELD2',
 'MAT/HLA/DRB1/SER/FIELD1',
 'MAT/HLA/DRB1/SER/FIELD2',
 'MAT/HLA/DRB1/DNA/FIELD1',
 'MAT/HLA/DRB1/DNA/FIELD2',
 'MAT/HLA/DRB3/DNA/FIELD1',
 'MAT/HLA/DRB3/DNA/FIELD2',
 'MAT/HLA/DRB4/DNA/FIELD1',
 'MAT/HLA/DRB4/DNA/FIELD2',
 'MAT/HLA/DRB5/DNA/FIELD1',
 'MAT/HLA/DRB5/DNA/FIELD2',
 'MAT/HLA/DQA1/DNA/FIELD1',
 'MAT/HLA/DQA1/DNA/FIELD2',
 'MAT/HLA/DQB1/SER/FIELD1',
 'MAT/HLA/DQB1/SER/FIELD2',
 'MAT/HLA/DQB1/DNA/FIELD1',
 'MAT/HLA/DQB1/DNA/FIELD2',
 'MAT/HLA/DPA1/DNA/FIELD1',
 'MAT/HLA/DPA1/DNA/FIELD2',
 'MAT/HLA/DPB1/DNA/FIELD1',
 'MAT/HLA/DPB1/DNA/FIELD2',
 'IDM/ANTI_CMV',
 'IDM/ANTI_CMV_DATE',
 'IDM/CMV_NAT_DATE',
 'MAT/IDM/ANTI_CMV',
 'MAT/IDM/ANTI_CMV_DATE',
 'MAT/IDM/CMV_NAT_DATE',
 'BANK_MANUF_ID',
 'BANK_DISTRIB_ID'];

  cHeadersList: array of string = ['GRID',
 'ATTR',
 'BIRTH_DATE',
 'SEX',
 'ABO',
 'RHESUS',
 'ETHN',
 'CCR5',
 'HLA',
 'KIR',
 'IDM',
 'RSV_PAT',
 'STATUS',
 'STAT_END_DATE',
 'STAT_REASON',
 'CONTACT_DATE',
 'CHECKUP_DATE',
 'WEIGHT',
 'HEIGHT',
 'NMBR_TRANS',
 'NMBR_PREG',
 'NMBR_MARR',
 'NMBR_PBSC',
 'COLL_TYPE',
 'LOCAL_ID',
 'BAG_ID',
 'COLL_DATE',
 'PROC_DATE',
 'PROC_METH',
 'PROC_METH_TYPE',
 'FREEZE_DATE',
 'FREEZE_METH',
 'PROD_MOD',
 'BAG_TYPE',
 'BAGS',
 'BACT_CULT',
 'FUNG_CULT',
 'HEMO_STATUS',
 'VOL',
 'VOL_FRZN',
 'TNC',
 'TNC_FRZN',
 'RED_BC_FRZN',
 'MNC_FRZN',
 'CD34PC',
 'CD34PC_FRZN',
 'CFU_FRZN',
 'VIABILITY',
 'VIABILITY_DATE',
 'VIABILITY_CELLS',
 'VIABILITY_METHOD',
 'ATT_SEG',
 'DNA_SMPL',
 'OTH_SMPL',
 'CT_COMPLETE_DATE',
 'CT_SMPL_TYPE',
 'AL_RED_BC',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'ID',
 'MAT_ID',
 'MAT_ID_BANK',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'IDM_CMV',
 'IDM_CMV_NAT',
 'IDM_CMV_DATE',
 'IDM_HBS_AG',
 'IDM_ANTI_HBC',
 'IDM_ANTI_HBS',
 'IDM_ANTI_HCV',
 'IDM_ANTI_HIV_12',
 'IDM_HIV_1_NAT',
 'IDM_HIV_P24',
 'IDM_HCV_NAT',
 'IDM_ANTI_HTLV',
 'IDM_SYPHILIS',
 'IDM_WNV',
 'IDM_CHAGAS',
 'IDM_EBV',
 'IDM_TOXO',
 'IDM_HBV_NAT',
 'IDM_PB19_NAT',
 'IDM_ALT',
 'MAT_IDM_CMV',
 'MAT_IDM_CMV_NAT',
 'MAT_IDM_CMV_DATE',
 'MAT_IDM_HBS_AG',
 'MAT_IDM_ANTI_HBC',
 'MAT_IDM_ANTI_HBS',
 'MAT_IDM_ANTI_HCV',
 'MAT_IDM_ANTI_HIV_12',
 'MAT_IDM_HIV_1_NAT',
 'MAT_IDM_HIV_P24',
 'MAT_IDM_HCV_NAT',
 'MAT_IDM_ANTI_HTLV',
 'MAT_IDM_SYPHILIS',
 'MAT_IDM_WNV',
 'MAT_IDM_CHAGAS',
 'MAT_IDM_EBV',
 'MAT_IDM_TOXO',
 'MAT_IDM_HBV_NAT',
 'MAT_IDM_PB19_NAT',
 'MAT_IDM_ALT',
 'KIR_KIR2DL1',
 'KIR_KIR2DL2',
 'KIR_KIR2DL3',
 'KIR_KIR2DL4',
 'KIR_KIR2DL5A',
 'KIR_KIR2DL5B',
 'KIR_KIR2DS1',
 'KIR_KIR2DS2',
 'KIR_KIR2DS3',
 'KIR_KIR2DS4',
 'KIR_KIR2DS5',
 'KIR_KIR2DP1',
 'KIR_KIR3DL1',
 'KIR_KIR3DL2',
 'KIR_KIR3DL3',
 'KIR_KIR3DS1',
 'KIR_KIR3DP1',
 'KIR_KIR_GL',
 'HLA_A_SER_FIELD1',
 'HLA_A_SER_FIELD2',
 'HLA_A_DNA_FIELD1',
 'HLA_A_DNA_FIELD2',
 'HLA_B_SER_FIELD1',
 'HLA_B_SER_FIELD2',
 'HLA_B_DNA_FIELD1',
 'HLA_B_DNA_FIELD2',
 'HLA_C_SER_FIELD1',
 'HLA_C_SER_FIELD2',
 'HLA_C_DNA_FIELD1',
 'HLA_C_DNA_FIELD2',
 'HLA_DRB1_SER_FIELD1',
 'HLA_DRB1_SER_FIELD2',
 'HLA_DRB1_DNA_FIELD1',
 'HLA_DRB1_DNA_FIELD2',
 'HLA_DRB3_DNA_FIELD1',
 'HLA_DRB3_DNA_FIELD2',
 'HLA_DRB4_DNA_FIELD1',
 'HLA_DRB4_DNA_FIELD2',
 'HLA_DRB5_DNA_FIELD1',
 'HLA_DRB5_DNA_FIELD2',
 'HLA_DQA1_DNA_FIELD1',
 'HLA_DQA1_DNA_FIELD2',
 'HLA_DQB1_SER_FIELD1',
 'HLA_DQB1_SER_FIELD2',
 'HLA_DQB1_DNA_FIELD1',
 'HLA_DQB1_DNA_FIELD2',
 'HLA_DQB1_DNA_FIELD1',
 'HLA_DPA1_DNA_FIELD1',
 'HLA_DPA1_DNA_FIELD2',
 'HLA_DPB1_DNA_FIELD1',
 'HLA_DPB1_DNA_FIELD2',
 'MAT_HLA_A_SER_FIELD1',
 'MAT_HLA_A_SER_FIELD2',
 'MAT_HLA_A_DNA_FIELD1',
 'MAT_HLA_A_DNA_FIELD2',
 'MAT_HLA_B_SER_FIELD1',
 'MAT_HLA_B_SER_FIELD2',
 'MAT_HLA_B_DNA_FIELD1',
 'MAT_HLA_B_DNA_FIELD2',
 'MAT_HLA_C_SER_FIELD1',
 'MAT_HLA_C_SER_FIELD2',
 'MAT_HLA_C_DNA_FIELD1',
 'MAT_HLA_C_DNA_FIELD2',
 'MAT_HLA_DRB1_SER_FIELD1',
 'MAT_HLA_DRB1_SER_FIELD2',
 'MAT_HLA_DRB1_DNA_FIELD1',
 'MAT_HLA_DRB1_DNA_FIELD2',
 'MAT_HLA_DRB3_DNA_FIELD1',
 'MAT_HLA_DRB3_DNA_FIELD2',
 'MAT_HLA_DRB4_DNA_FIELD1',
 'MAT_HLA_DRB4_DNA_FIELD2',
 'MAT_HLA_DRB5_DNA_FIELD1',
 'MAT_HLA_DRB5_DNA_FIELD2',
 'MAT_HLA_DQA1_DNA_FIELD1',
 'MAT_HLA_DQA1_DNA_FIELD2',
 'MAT_HLA_DQB1_SER_FIELD1',
 'MAT_HLA_DQB1_SER_FIELD2',
 'MAT_HLA_DQB1_DNA_FIELD1',
 'MAT_HLA_DQB1_DNA_FIELD2',
 'MAT_HLA_DPA1_DNA_FIELD1',
 'MAT_HLA_DPA1_DNA_FIELD2',
 'MAT_HLA_DPB1_DNA_FIELD1',
 'MAT_HLA_DPB1_DNA_FIELD2',
 'IDM_ANTI_CMV',
 'IDM_ANTI_CMV_DATE',
 'IDM_CMV_NAT_DATE',
 'MAT_IDM_ANTI_CMV',
 'MAT_IDM_ANTI_CMV_DATE',
 'MAT_IDM_CMV_NAT_DATE'
 ];


  cBanksManDistr21: array of string = ['BANK_MANUF_ID', 'BANK_DISTRIB'];
  cBanksManDistr22: array of string = ['BANK_MANUF_ID_WMDAID', 'BANK_MANUF_ID_EMDISID', 'BANK_DISTRIB_ID_WMDAID', 'BANK_DISTRIB_EMDISID'];
  cINVENTORY = 'INVENTORY';
  cVersionAttrib = 'SCHEMA_VERSION';
  cv2_1 = '2.1';
  cv2_2 = '2.2';
implementation

end.
