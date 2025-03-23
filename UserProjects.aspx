<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjects.aspx.cs" Inherits="MilestoneThreeData.UserProjects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Projects Management</title>
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
            content: '\f47f'; /* Bootstrap icon for person */
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

        /* Button Styles */
        .button {
            background-color: var(--primary-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .button:hover {
            background-color: var(--secondary-color);
        }

        .edit-btn {
            background-color: var(--primary-color);
        }

        .delete-btn {
            background-color: var(--primary-color);
        }

        .edit-btn:hover, .delete-btn:hover {
            background-color: var(--secondary-color);
        }

        /* Form Styles */
        .form-view-container {
            margin-top: 30px;
            padding: 25px;
            background-color: var(--card-bg);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            color: var(--primary-color);
            font-weight: 500;
            margin-bottom: 8px;
        }

        .form-input {
            padding: 12px 15px;
            background-color: #333;
            border: 1px solid var(--card-border);
            border-radius: 6px;
            color: var(--text-light);
            width: 100%;
            max-width: 350px;
            transition: all 0.3s ease;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 0, 0.2), inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-actions {
            margin-top: 25px;
            display: flex;
            gap: 10px;
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
            <li><a href="UserProjects.aspx"class="active"><i class="bi bi-person-workspace"></i> <span>Users Project</span></a></li>
<li><a href="UserTasks.aspx"><i class="bi bi-clipboard-check"></i> <span>Users Task</span></a></li>
            <li><a href="UserAndProject.aspx"><i class="bi bi-person-workspace"></i> <span>User Projects</span></a></li>
            <li><a href="TopThreePerformer.aspx"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
            
        </ul>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="title"><i class="bi bi-person-workspace"></i> User Project Assignments</h1>
                <div class="actions">
                    <asp:LinkButton ID="RefreshButton" runat="server" CssClass="button">
                        <i class="bi bi-arrow-clockwise"></i> Refresh
                    </asp:LinkButton>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="grid-style">
                <Columns>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="button edit-btn">
                                <i class="bi bi-pencil-square"></i> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="button delete-btn"
                                OnClientClick="return confirm('Are you sure you want to delete this assignment?');">
                                <i class="bi bi-trash"></i> Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="button">
                                <i class="bi bi-check-lg"></i> Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="button">
                                <i class="bi bi-x-lg"></i> Cancel
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="ROLE_IN_PROJECT" HeaderText="Role" SortExpression="ROLE_IN_PROJECT" />
                    <asp:BoundField DataField="ASSIGNED_DATE" HeaderText="Assigned Date" SortExpression="ASSIGNED_DATE"
                        DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" ItemStyle-CssClass="date-format" />
                </Columns>
            </asp:GridView>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID,PROJECT_ID"
                DataSourceID="SqlDataSource1" CssClass="form-view-container">
                <EditItemTemplate>
                    <div class="form-edit">
                        <h3><i class="bi bi-pencil-square"></i> Edit Assignment</h3>
                        <div class="form-group">
                            <label class="form-label">User ID:</label>
                            <asp:Label ID="USER_IDLabel1" runat="server" Text='<%# Eval("USER_ID") %>' CssClass="form-id" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Project ID:</label>
                            <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="form-id" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Role:</label>
                            <asp:TextBox ID="ROLE_IN_PROJECTTextBox" runat="server" Text='<%# Bind("ROLE_IN_PROJECT") %>' CssClass="form-input" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Assigned Date:</label>
                            <asp:TextBox ID="ASSIGNED_DATETextBox" runat="server"
                                Text='<%# Bind("ASSIGNED_DATE", "{0:yyyy-MM-dd}") %>'
                                TextMode="Date" CssClass="form-input" />
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="button" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="button" />
                        </div>
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-insert">
                        <h3><i class="bi bi-person-plus-fill"></i> New Assignment</h3>
                        <div class="form-group">
                            <label class="form-label">User ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="form-input" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Project ID:</label>
                            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-input" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Role:</label>
                            <asp:TextBox ID="ROLE_IN_PROJECTTextBox" runat="server" Text='<%# Bind("ROLE_IN_PROJECT") %>' CssClass="form-input" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Assigned Date:</label>
                            <asp:TextBox ID="ASSIGNED_DATETextBox" runat="server"
                                Text='<%# Bind("ASSIGNED_DATE") %>'
                                TextMode="Date" CssClass="form-input" />
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="button" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="button" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-view">
                        <div class="form-actions">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button">
                                <i class="bi bi-plus-lg"></i> Add New Assignment
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <!-- Original SqlDataSource remains unchanged -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;USERPROJECTS&quot; WHERE &quot;USER_ID&quot; = :original_USER_ID AND &quot;PROJECT_ID&quot; = :original_PROJECT_ID AND ((&quot;ROLE_IN_PROJECT&quot; = :original_ROLE_IN_PROJECT) OR (&quot;ROLE_IN_PROJECT&quot; IS NULL AND :original_ROLE_IN_PROJECT IS NULL)) AND ((&quot;ASSIGNED_DATE&quot; = :original_ASSIGNED_DATE) OR (&quot;ASSIGNED_DATE&quot; IS NULL AND :original_ASSIGNED_DATE IS NULL))"
                InsertCommand="INSERT INTO &quot;USERPROJECTS&quot; (&quot;USER_ID&quot;, &quot;PROJECT_ID&quot;, &quot;ROLE_IN_PROJECT&quot;, &quot;ASSIGNED_DATE&quot;) VALUES (:USER_ID, :PROJECT_ID, :ROLE_IN_PROJECT, :ASSIGNED_DATE)"
                OldValuesParameterFormatString="original_{0}"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;USER_ID&quot;, &quot;PROJECT_ID&quot;, &quot;ROLE_IN_PROJECT&quot;, &quot;ASSIGNED_DATE&quot; FROM &quot;USERPROJECTS&quot;"
                UpdateCommand="UPDATE &quot;USERPROJECTS&quot; SET &quot;ROLE_IN_PROJECT&quot; = :ROLE_IN_PROJECT, &quot;ASSIGNED_DATE&quot; = :ASSIGNED_DATE WHERE &quot;USER_ID&quot; = :original_USER_ID AND &quot;PROJECT_ID&quot; = :original_PROJECT_ID AND ((&quot;ROLE_IN_PROJECT&quot; = :original_ROLE_IN_PROJECT) OR (&quot;ROLE_IN_PROJECT&quot; IS NULL AND :original_ROLE_IN_PROJECT IS NULL)) AND ((&quot;ASSIGNED_DATE&quot; = :original_ASSIGNED_DATE) OR (&quot;ASSIGNED_DATE&quot; IS NULL AND :original_ASSIGNED_DATE IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                    <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="original_ROLE_IN_PROJECT" Type="String" />
                    <asp:Parameter Name="original_ASSIGNED_DATE" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="ROLE_IN_PROJECT" Type="String" />
                    <asp:Parameter Name="ASSIGNED_DATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ROLE_IN_PROJECT" Type="String" />
                    <asp:Parameter Name="ASSIGNED_DATE" Type="DateTime" />
                    <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                    <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="original_ROLE_IN_PROJECT" Type="String" />
                    <asp:Parameter Name="original_ASSIGNED_DATE" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>