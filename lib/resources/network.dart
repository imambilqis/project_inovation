import 'package:dio/dio.dart';
import 'package:project_inovation/core/models/login_model.dart';
import 'package:project_inovation/core/models/tms_model.dart';

class NetworkHelper {
  static Dio _dio;
  static final _urlApi = 'https://ladri-mzl.karyakoe.id';

  static Dio getDio() {
    if (null == _dio) {
      _dio = Dio(BaseOptions(baseUrl: _urlApi))
        ..interceptors.add(LogInterceptor(responseBody: true));
    }
    return _dio;
  }

  Future post(String url, dynamic data) async {
    Response response = await getDio().post(
      url,
      data: data,
    );

    switch (response.statusCode) {
      case 200:
        return response.data.toString().contains('error')
            ? Response(data: response.data, statusCode: 404)
            : response;
      case 500:
        return 'Server sedang gangguan, harap coba beberapa saat lagi';
      default:
        return 'Server bermasalah, harap kontak admin';
    }
  }

  Future postLogin(PostLoginModel body) async {
    String loginSoap = '''
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:adin="http://3e.pl/ADInterface">
   <soapenv:Header/>
   <soapenv:Body>
      <adin:readData>
         <adin:ModelCRUDRequest>
            <adin:ModelCRUD>
               <adin:serviceType>API-READ</adin:serviceType>
               <adin:RecordID>1181475</adin:RecordID>
            </adin:ModelCRUD>
            <adin:ADLoginRequest>
               <adin:user>${body.username}</adin:user>
               <adin:pass>${body.password}</adin:pass>
            </adin:ADLoginRequest>
         </adin:ModelCRUDRequest>
      </adin:readData>
   </soapenv:Body>
</soapenv:Envelope>''';

    var response = await post(_urlApi, loginSoap);
    return response;
  }
  Future createTransorder(PostTMSModel) async{
    String TransorderSoap='''
   <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:adin="http://3e.pl/ADInterface">
   <soapenv:Header/>
   <soapenv:Body>
      <adin:createData>
         <adin:ModelCRUDRequest>
            <adin:ModelCRUD>
               <adin:serviceType>CREATE-TRANSORDER</adin:serviceType>
               <adin:TableName>XX_TransOrder</adin:TableName>
               <adin:RecordID>0</adin:RecordID>
               <adin:Action>Create</adin:Action>
               <!--Optional:-->
               <adin:DataRow>
                  <!--Zero or more repetitions:-->
                  <adin:field column="XM_Driver_ID">
                     <adin:val>1001149</adin:val>
                  </adin:field>
                  
                  <adin:field column="XM_Fleet_ID">
                     <adin:val>1000467</adin:val>
                  </adin:field>
                  <adin:field column="ContractStatus">
                     <adin:val>On Call</adin:val>
                  </adin:field>
                  <adin:field column="M_Product_ID">
                     <adin:val>1004704</adin:val>
                  </adin:field>
                  <adin:field column="ETD">
                     <adin:val>2020-02-06 00:00:00.0</adin:val>
                  </adin:field>
                  <adin:field column="ETA">
                     <adin:val>2020-02-07 00:00:00.0</adin:val>
                  </adin:field>
                  <adin:field column="TransferAmt">
                     <adin:val>950000</adin:val>
                  </adin:field>
                  <adin:field column="Customer_ID">
                     <adin:val>1002975</adin:val>
                  </adin:field>
                  <adin:field column="C_Cashbook_ID">
                     <adin:val>1000012</adin:val>
                  </adin:field>
               </adin:DataRow>
            </adin:ModelCRUD>
            <adin:ADLoginRequest>
               <adin:user>SuperUser</adin:user>
               <adin:pass>barebear</adin:pass>
               <adin:lang>192</adin:lang>
               <adin:ClientID>1000002</adin:ClientID>
               <adin:RoleID>1000037</adin:RoleID>
               <adin:OrgID>1000005</adin:OrgID>
               <adin:WarehouseID>1000002</adin:WarehouseID>
               <adin:stage>0</adin:stage>
            </adin:ADLoginRequest>
         </adin:ModelCRUDRequest>
      </adin:createData>
   </soapenv:Body>
</soapenv:Envelope>
    ''';
   var responsee = await post(_urlApi, TransorderSoap);
   return responsee;
  }
  Future transroute (PostTMSModel) async{
    String TransrouteSoap=''' 
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:adin="http://3e.pl/ADInterface">
   <soapenv:Header/>
   <soapenv:Body>
      <adin:createData>
         <adin:ModelCRUDRequest>
            <adin:ModelCRUD>
               <adin:serviceType>CREATE-TRANSROUTE</adin:serviceType>
               <adin:TableName>XX_TransRoute</adin:TableName>
               <adin:RecordID>0</adin:RecordID>
               <adin:Action>Create</adin:Action>
               <!--Optional:-->
               <adin:DataRow>
                  <!--Zero or more repetitions:-->
                  <adin:field column="XX_TransOrder_ID">
                     <adin:val>1186016</adin:val>
                  </adin:field>
                  <adin:field column="From_ID">
                     <adin:val>1002740</adin:val>
                  </adin:field>
                  <adin:field column="To_ID">
                     <adin:val>1003003</adin:val>
                  </adin:field>
               </adin:DataRow>
            </adin:ModelCRUD>
            <adin:ADLoginRequest>
               <adin:user>SuperUser</adin:user>
               <adin:pass>barebear</adin:pass>
               <adin:lang>192</adin:lang>
               <adin:ClientID>1000002</adin:ClientID>
               <adin:RoleID>1000037</adin:RoleID>
               <adin:OrgID>1000005</adin:OrgID>
               <adin:WarehouseID>1000002</adin:WarehouseID>
               <adin:stage>0</adin:stage>
            </adin:ADLoginRequest>
         </adin:ModelCRUDRequest>
      </adin:createData>
   </soapenv:Body>
</soapenv:Envelope>
    ''';
    var responseee = await post(_urlApi, TransrouteSoap);
    return responseee;
  }

}
