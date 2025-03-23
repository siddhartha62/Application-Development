<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAndProject.aspx.cs" Inherits="MilestoneThreeData.UserAndProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User and Project Management</title>
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

    /* Sidebar Styles (unchanged) */
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
        padding: 20px;
        width: calc(100% - 280px);
        min-height: 100vh;
    }

    .header {
        background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        color: var(--text-light);
        padding: 15px 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    /* Modified Table Styles */
    .grid-style {
        width: 98%;
        border-collapse: collapse;
        margin: 15px 0;
        background-color: var(--card-bg);
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
        font-size: 0.9rem;
    }

    .grid-style th {
        background-color: rgba(255, 107, 0, 0.2);
        color: var(--primary-color);
        padding: 12px 10px;
        text-align: left;
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 2px solid rgba(255, 107, 0, 0.3);
    }

    .grid-style td {
        padding: 10px 8px;
        border-bottom: 1px solid var(--card-border);
        color: var(--text-light);
        line-height: 1.3;
    }

    .grid-style tr:nth-child(even) {
        background-color: rgba(42, 42, 42, 0.4);
    }

    .grid-style tr:hover {
        background-color: rgba(255, 107, 0, 0.06);
    }

    .dropdown-style {
        padding: 6px 10px;
        background-color: #333;
        border: 1px solid var(--card-border);
        border-radius: 4px;
        color: var(--text-light);
        width: 100%;
        font-size: 0.85rem;
        transition: all 0.2s ease;
    }

    .dropdown-style:focus {
        border-color: var(--primary-color);
        outline: none;
        box-shadow: 0 0 0 2px rgba(255, 107, 0, 0.2);
    }

    /* Column Size Optimization */
    .grid-style th:nth-child(1),
    .grid-style td:nth-child(1) { width: 80px; } /* User ID */
    .grid-style th:nth-child(2),
    .grid-style td:nth-child(2) { width: 100px; } /* Project ID */
    .grid-style th:nth-child(4),
    .grid-style td:nth-child(4) { width: 120px; } /* Dates */

    /* Icons */
    .grid-style th::before {
        font-family: "bootstrap-icons";
        margin-right: 8px;
        font-size: 0.85rem;
    }
    .grid-style th:nth-child(1)::before { content: "\f47f"; } /* User */
    .grid-style th:nth-child(2)::before { content: "\f3af"; } /* Project */
    .grid-style th:nth-child(3)::before { content: "\f0c0"; } /* Role */
    .grid-style th:nth-child(4)::before { content: "\f073"; } /* Date */
</style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-brand">
            <h2>Project Management</h2>
            <p>Task Organization System</p>
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
            <li><a href="UserAndProject.aspx"class="active"><i class="bi bi-person-workspace"></i> <span>User Projects</span></a></li>
            <li><a href="TopThreePerformer.aspx"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
            
        </ul>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="title"><i class="bi bi-person-workspace"></i> User and Project Management</h1>
                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="USER_NAME" 
                    DataValueField="USER_ID" CssClass="dropdown-style">
                </asp:DropDownList>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="grid-style">
                <Columns>
                    <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="ROLE_IN_PROJECT" HeaderText="Role" SortExpression="ROLE_IN_PROJECT" />
                    <asp:BoundField DataField="ASSIGNED_DATE" HeaderText="Assigned Date" SortExpression="ASSIGNED_DATE" 
                        DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="USER_NAME" DataValueField="USER_ID" 
                                SelectedValue='<%# Bind("USER_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Email">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="USER_EMAIL" DataValueField="USER_ID" 
                                SelectedValue='<%# Bind("USER_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Contact">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="USER_CONTACT" DataValueField="USER_ID" 
                                SelectedValue='<%# Bind("USER_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" 
                                DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" 
                                DataTextField="PROJECT_STARTDATE" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Due Date">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource3" 
                                DataTextField="PROJECT_DUEDATE" DataValueField="PROJECT_ID" 
                                SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="dropdown-style">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource3" 
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
                SelectCommand="SELECT * FROM &quot;USERPROJECTS&quot; WHERE (&quot;USER_ID&quot; = :USER_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList4" Name="USER_ID" 
                        PropertyName="SelectedValue" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;User&quot;"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>