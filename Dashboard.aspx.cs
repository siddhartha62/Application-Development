using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Data;
using System.Configuration;
using Oracle.ManagedDataAccess.Client; // Correct namespace for ODP.NET
using System.Web.Script.Serialization;

namespace Coursework
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            LoadTotalUsers();
            LoadTotalProjects();
            LoadActiveTasks();
            LoadUpcomingMilestones();
            LoadTopPerformer();
            LoadProjectStatusChartData();
        }

        private void LoadTotalUsers()
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string sql = "SELECT COUNT(*) FROM \"User\"";
                    using (OracleCommand cmd = new OracleCommand(sql, conn))
                    {
                        lblTotalUsers.Text = cmd.ExecuteScalar().ToString();
                    }
                }
            }
            catch
            {
                lblTotalUsers.Text = "0";
            }
        }

        private void LoadTotalProjects()
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string sql = "SELECT COUNT(*) FROM \"PROJECT\"";
                    using (OracleCommand cmd = new OracleCommand(sql, conn))
                    {
                        lblTotalProjects.Text = cmd.ExecuteScalar().ToString();
                    }
                }
            }
            catch
            {
                lblTotalProjects.Text = "0";
            }
        }

        private void LoadActiveTasks()
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string sql = "SELECT COUNT(*) FROM \"TASK\" WHERE \"task_status\" = 'Ongoing'";
                    using (OracleCommand cmd = new OracleCommand(sql, conn))
                    {
                        lblActiveTasks.Text = cmd.ExecuteScalar().ToString();
                    }
                }
            }
            catch
            {
                lblActiveTasks.Text = "0";
            }
        }

        private void LoadUpcomingMilestones()
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string sql = "SELECT COUNT(*) FROM \"MILESTONE\" WHERE \"milestone_due_date\" BETWEEN SYSDATE AND SYSDATE + 30";
                    using (OracleCommand cmd = new OracleCommand(sql, conn))
                    {
                        lblUpcomingMilestones.Text = cmd.ExecuteScalar().ToString();
                    }
                }
            }
            catch
            {
                lblUpcomingMilestones.Text = "0";
            }
        }

        private void LoadTopPerformer()
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string sql = "SELECT u.\"user_name\" FROM \"USER\" u JOIN \"TOP_PERFORMER\" tp ON u.\"user_id\" = tp.\"user_id\" WHERE ROWNUM = 1 ORDER BY tp.\"performance_score\" DESC";
                    using (OracleCommand cmd = new OracleCommand(sql, conn))
                    {
                        object result = cmd.ExecuteScalar();
                        lblTopPerformer.Text = result != null ? result.ToString() : "N/A";
                    }
                }
            }
            catch
            {
                lblTopPerformer.Text = "N/A";
            }
        }

        private void LoadProjectStatusChartData()
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string sql = "SELECT \"PROJECT_STATUS\", COUNT(*) as count FROM \"PROJECT\" GROUP BY \"PROJECT_STATUS\"";
                    using (OracleCommand cmd = new OracleCommand(sql, conn))
                    {
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            var labels = new List<string>();
                            var data = new List<int>();

                            while (reader.Read())
                            {
                                labels.Add(reader["PROJECT_STATUS"].ToString());
                                data.Add(Convert.ToInt32(reader["count"]));
                            }

                            if (labels.Count == 0)
                            {
                                labels.AddRange(new[] { "In Progress", "Completed", "Planned", "Delayed", "Cancelled" });
                                data.AddRange(new[] { 5, 8, 3, 2, 1 });
                            }

                            hdnProjectStatusData.Value = new JavaScriptSerializer().Serialize(new
                            {
                                labels = labels.ToArray(),
                                data = data.ToArray()
                            });
                        }
                    }
                }
            }
            catch
            {
                hdnProjectStatusData.Value = new JavaScriptSerializer().Serialize(new
                {
                    labels = new[] { "In Progress", "Completed", "Planned", "Delayed", "Cancelled" },
                    data = new[] { 5, 8, 3, 2, 1 }
                });
            }
        }
    }
}