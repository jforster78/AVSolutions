using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using AvSolutions.Models;

namespace AvSolutions
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service
    {
        //To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        //To create an operation that returns XML,
        //add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //and include the following line in the operation body:
        //WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        //Specifying message exchange format is JSON  
        [WebInvoke(ResponseFormat = WebMessageFormat.Json)]

        //GetCompletionList Method.
        public List<string> GetCompletionList(string prefixText)
        {
            //This is to query the database to provide suggestions for the AJAX AutoComplete.
            ProductContext obj = new ProductContext();
            var x = from n in obj.Products
                    where n.ProductName.Substring(0, prefixText.Length).ToLower() == prefixText.ToLower()
                    select n;
            List<string> name = new List<string>();
            foreach (var item in x)
            {
                name.Add(item.ProductName.ToString());
            }
            return name;
        }

        //Add more operations here and mark them with [OperationContract]
    }
}
