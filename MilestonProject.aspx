<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MilestonProject.aspx.cs" Inherits="MilestoneThreeData.MilestonProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestones</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #ff6b00;
            --secondary-color: #ff9100;
            --accent-color: #ff5722;
            --dark-color: #1a1a1a;
            --darker-color: #151515;
            --text-light: #ffffff;
            --text-muted: #b0b0b0;
            --card-bg: #242424;
            --card-border: #333333;
            --sidebar-bg: #1a1a1a;
            --sidebar-hover: #292929;
            --orange-glow: rgba(255, 107, 0, 0.1);
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1e1e1e;
            display: flex;
            color: var(--text-light);
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background-color: var(--sidebar-bg);
            color: var(--text-light);
            padding: 20px 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
            height: 100vh;
            position: fixed;
            border-right: 1px solid var(--card-border);
        }

        .sidebar-brand {
            padding: 15px 25px;
            border-bottom: 1px solid var(--card-border);
            margin-bottom: 20px;
        }

        .sidebar h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            font-weight: 600;
            color: var(--primary-color);
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 5px 0;
        }

        .sidebar ul li a {
            color: var(--text-light);
            text-decoration: none;
            padding: 15px 25px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }

        .sidebar ul li a:hover,
        .sidebar ul li a.active {
            background-color: var(--sidebar-hover);
            border-left: 3px solid var(--primary-color);
            color: var(--primary-color);
        }

        .sidebar ul li a i {
            margin-right: 15px;
            width: 20px;
            text-align: center;
            font-size: 1.2rem;
        }

        /* Main Content */
        .container {
            margin-left: 280px;
            padding: 2rem;
            width: calc(100% - 280px);
            background-color: #1e1e1e;
            min-height: 100vh;
        }

        .header {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: var(--text-light);
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .grid-style {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 25px 0;
            background-color: var(--card-bg);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .grid-style th {
            background-color: rgba(255, 107, 0, 0.2);
            color: var(--primary-color);
            padding: 18px 15px;
            text-align: left;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
            border-bottom: 2px solid rgba(255, 107, 0, 0.3);
        }

        .grid-style td {
            padding: 16px 15px;
            border-bottom: 1px solid var(--card-border);
            color: var(--text-light);
            font-size: 0.95rem;
        }

        .grid-style tr:nth-child(even) {
            background-color: rgba(42, 42, 42, 0.5);
        }

        .grid-style tr:hover {
            background-color: rgba(255, 107, 0, 0.08);
        }

        .dropdown-style {
            padding: 8px 12px;
            background-color: #333;
            border: 1px solid var(--card-border);
            border-radius: 6px;
            color: var(--text-light);
            width: 100%;
            transition: all 0.3s ease;
        }

        .dropdown-style:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 0, 0.2);
        }

        /* Add icons to grid headers */
        .grid-style th:nth-child(1)::before { content: "\f4ce"; } /* ID */
        .grid-style th:nth-child(2)::before { content: "\f5d1"; } /* Milestone */
        .grid-style th:nth-child(3)::before { content: "\f1e1"; } /* Date */
        .grid-style th:nth-child(4)::before { content: "\f3af"; } /* Project */
        .grid-style th:nth-child(5)::before { content: "\f1ad"; } /* Name */
        .grid-style th:nth-child(6)::before { content: "\f133"; } /* Start Date */
        .grid-style th:nth-child(7)::before { content: "\f274"; } /* Due Date */
        .grid-style th:nth-child(8)::before { content: "\f252"; } /* Status */

        .grid-style th::before {
            font-family: "bootstrap-icons";
            margin-right: 10px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
   <!-- Sidebar -->
   <div class="sidebar">
       <div class="sidebar-brand">
           <h2>Project Management</h2>
           <p>Analytics Dashboard</p>
       </div>
       <ul>
                      <li><a href="Dashboard.aspx" ><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
            <li><a href="User.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
            <li><a href="Project.aspx"><i class="bi bi-kanban-fill"></i> <span>Projects</span></a></li>
            <li><a href="Task.aspx"><i class="bi bi-list-check"></i> <span>Tasks</span></a></li>
            <li><a href="Subtask.aspx"><i class="bi bi-card-checklist"></i> <span>Subtasks</span></a></li>
            <li><a href="Milestone.aspx"><i class="bi bi-flag-fill"></i> <span>Milestones</span></a></li>
            <li><a href="UserProjects.aspx"><i class="bi bi-person-workspace"></i> <span>Users Project</span></a></li>
<li><a href="UserTasks.aspx"><i class="bi bi-clipboard-check"></i> <span>Users Task</span></a></li>
            <li><a href="UserAndProject.aspx"><i class="bi bi-person-workspace"></i> <span>User Projects</span></a></li>
            <li><a href="TopThreePerformer.aspx"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx" class="active"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
            
       </ul>
   </div>
    

    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1><i class="bi bi-graph-up"></i> Project Milestones</h1>
                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" 
                    DataValueField="PROJECT_ID" CssClass="dropdown-style">
                </asp:DropDownList>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1" CssClass="grid-style">
                <Columns>
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone" SortExpression="MILESTONE_NAME" />
                    <asp:BoundField DataField="MILESTONE_DUEDATE" HeaderText="Due Date" SortExpression="MILESTONE_DUEDATE" 
                        DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false"/>
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" SortExpression="PROJECT_ID" />
                    
                    <asp:TemplateField HeaderText="Project">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="PROJECT_STARTDATE" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Due Date">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="PROJECT_DUEDATE" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="PROJECT_STATUS" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;MILESTONE&quot; WHERE (&quot;PROJECT_ID&quot; = :PROJECT_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList5" Name="PROJECT_ID" 
                        PropertyName="SelectedValue" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>