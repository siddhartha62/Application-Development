<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopThreePerformer.aspx.cs" Inherits="MilestoneThreeData.TopThreePerformer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
    <!-- Include Bootstrap Icons CSS in the head section -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--dark-color);
            color: var(--text-light);
            display: flex;
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
            transition: all 0.3s ease;
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

        .sidebar p {
            font-size: 0.9rem;
            opacity: 0.7;
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

        .sidebar ul li a:hover, .sidebar ul li a.active {
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

        /* Main Content Styles */
        .container {
            margin-left: 280px;
            padding: 30px;
            width: calc(100% - 280px);
            background-color: var(--dark-color);
            min-height: 100vh;
        }

        .header {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: var(--text-light);
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .title {
            color: var(--text-light);
            margin: 0;
            font-size: 1.8rem;
            font-weight: 600;
            position: relative;
            padding-left: 40px;
        }

        .title::before {
            content: '\f091'; /* Bootstrap icon for award */
            font-family: 'bootstrap-icons';
            position: absolute;
            left: 0;
            font-size: 1.6rem;
            color: var(--primary-color);
            background-color: rgba(255, 107, 0, 0.15);
            width: 35px;
            height: 35px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Dropdown Styles */
        .dropdown {
            margin-bottom: 20px;
        }

        .dropdown select {
            padding: 10px 15px;
            background-color: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 6px;
            color: var(--text-light);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .dropdown select:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 0, 0.2);
        }

        /* Grid Styles */
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

        .grid-style tr:last-child td {
            border-bottom: none;
        }

        .grid-style tr:nth-child(even) {
            background-color: rgba(42, 42, 42, 0.5);
        }

        .grid-style tr:hover {
            background-color: rgba(255, 107, 0, 0.08);
            transform: translateY(-1px);
            transition: all 0.2s ease;
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
            <li><a href="TopThreePerformer.aspx"class="active"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
        </ul>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="title"><i class="bi bi-award-fill"></i> Top Performers</h1>
            </div>

            <!-- Dropdown for Project Selection -->
            <div class="dropdown">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" CssClass="dropdown-select">
                </asp:DropDownList>
            </div>

            <!-- GridView for Top Performers -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="grid-style">
                <Columns>
                    <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME" />
                    <asp:BoundField DataField="ROLE_IN_PROJECT" HeaderText="Role in Project" SortExpression="ROLE_IN_PROJECT" />
                    <asp:BoundField DataField="USER_EMAIL" HeaderText="User Email" SortExpression="USER_EMAIL" />
                    <asp:BoundField DataField="USER_CONTACT" HeaderText="User Contact" SortExpression="USER_CONTACT" />
                    <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="Completed Tasks" SortExpression="COMPLETED_TASKS" />
                </Columns>
            </asp:GridView>

            <!-- SqlDataSource for GridView -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (
    SELECT 
        u.User_Name,
        up.Role_In_Project,
        u.User_Email, 
        u.User_Contact,
        COUNT(t.Task_ID) AS Completed_Tasks
    FROM 
        &quot;User&quot; u,
        UserTasks ut,
        Task t,
        Milestone m,
        UserProjects up
    WHERE 
        u.User_ID = ut.User_ID
        AND ut.Task_ID = t.Task_ID
        AND t.Milestone_ID = m.Milestone_ID
        AND u.User_ID = up.User_ID
        AND m.Project_ID = up.Project_ID
        AND m.Project_ID = :PROJECT_ID
    GROUP BY 
        u.User_Name, up.Role_In_Project, u.User_Email, u.User_Contact
    ORDER BY 
        COUNT(t.Task_ID) DESC
) WHERE ROWNUM <= 3">
                <SelectParameters>
                    <asp:ControlParameter Name="PROJECT_ID" ControlID="DropDownList1" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- SqlDataSource for DropDownList -->
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>