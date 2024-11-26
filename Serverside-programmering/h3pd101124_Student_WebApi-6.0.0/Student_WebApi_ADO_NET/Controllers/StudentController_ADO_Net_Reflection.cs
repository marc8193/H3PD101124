using Microsoft.AspNetCore.Mvc;
using Contracts;
using Entities.DataTransferObjects;
using Entities.Models;
using Mapster;
using System.Net;
using Student_WebApi_ADO_NET.ViewModels;

namespace Student_WebApi_ADO_NET.Controllers
{
    public class StudentController_ADO_Net_Reflection : Controller
    {
        private ILoggerManager _logger;

        public StudentController_ADO_Net_Reflection(ILoggerManager logger)
        {
            this._logger = logger;
        }

        // POST: api/Student
        [HttpPost("CreateStudent_ADO_Net_Reflection")]
        public async Task<IActionResult> CreateStudent_ADO_Net_Reflection([FromBody] StudentForSaveDto StudentForSaveDto_Object,
                                                                           string UserName = "No Name")
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    this._logger.LogError($"ModelState is Invalid for {UserName} in action CreateStudent_ADO_Net_Reflection");
                    return BadRequest(ModelState);
                }

                Student Student_Object = new Student();
                Student_Object = StudentForSaveDto_Object.Adapt<Student>();

                // Fuld Generisk metode
                int SaveResult = Student_Object.InsertObjectToDatabase<Student>(Student.TABLE_NAME);

                if (SaveResult >= 0)
                {
                    return Ok($"Student : {Student_Object.StudentName} oprettet !!!");
                }
                else
                {
                    return BadRequest($"Noget gik galt, da {Student_Object.StudentName} : skulle oprettes !!!");
                }
            }
            catch (Exception Error)
            {
                _logger.LogError($"Something went wrong inside CreateStudent_ADO_Net_Reflection action for {UserName}: {Error.Message}");
                return StatusCode((int)HttpStatusCode.InternalServerError, $"Internal server error : {Error.ToString()}");
            }
        }

		// DELETE: api/Student/5
        [HttpDelete("DeleteStudent_ADO_Net/{StudentID}")]
        public async Task<IActionResult> DeleteStudent_ADO_Net(int StudentID,
                                                               string UserName = "No Name")
        {
            try
            {
                Student Student_Object = new Student();
                Student_Object.StudentID = StudentID;

                int result = Student_Object.DeleteObjectFromDatabase<Student>(Student.TABLE_NAME);

                this._logger.LogInfo($"Student with ID {StudentID} has been deleted in action DeleteStudent_ADO_Net by {UserName}");
                return Ok($"Student with ID {StudentID} has been deleted in action DeleteStudent_ADO_Net by {UserName}");

            }
            catch (Exception Error)
            {
                _logger.LogError($"Something went wrong inside DeleteStudent_ADO_Net action for {UserName}: {Error.Message}");
                return StatusCode((int)HttpStatusCode.InternalServerError, $"Internal server error : {Error.ToString()}");
            }
        }

    }
}
