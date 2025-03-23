<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtask.aspx.cs" Inherits="MilestoneThreeData.Subtask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtasks Management</title>
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
            padding: 30px;
            width: calc(100% - 280px);
            background-color: #1e1e1e;
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

        .form-view-container {
            margin-top: 30px;
            padding: 30px;
            background-color: var(--card-bg);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            border: 1px solid var(--card-border);
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
        }

        .form-label {
            display: block;
            width: 100%;
            color: var(--primary-color);
            font-weight: 500;
            margin-bottom: 12px;
            position: relative;
            padding-left: 30px;
            font-size: 1rem;
        }

        .form-label::before {
            font-family: "bootstrap-icons";
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2rem;
        }

        .form-label[for*="SUBTASK_ID"]::before { content: "\f4ce"; }
        .form-label[for*="SUBTASK_NAME"]::before { content: "\f5d1"; }
        .form-label[for*="SUBTASK_STATUS"]::before { content: "\f252"; }
        .form-label[for*="TASK_ID"]::before { content: "\f3af"; }

        .form-input {
            padding: 15px 18px;
            background-color: #333;
            border: 1px solid var(--card-border);
            border-radius: 8px;
            color: var(--text-light);
            width: 100%;
            max-width: 400px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 0, 0.2);
        }

        .button {
            background-color: var(--primary-color);
            color: var(--text-light);
            padding: 14px 28px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            position: relative;
            overflow: hidden;
            margin: 5px;
            box-shadow: 0 4px 10px rgba(255, 107, 0, 0.2);
        }

        .button:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(255, 107, 0, 0.25);
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
            <li><a href="Subtask.aspx" class="active"><i class="bi bi-card-checklist"></i> <span>Subtasks</span></a></li>
            <li><a href="Milestone.aspx"><i class="bi bi-flag-fill"></i> <span>Milestones</span></a></li>
            <li><a href="UserProjects.aspx"><i class="bi bi-person-workspace"></i> <span>Users Project</span></a></li>
<li><a href="UserTasks.aspx"><i class="bi bi-clipboard-check"></i> <span>Users Task</span></a></li>
            <li><a href="UserAndProject.aspx"><i class="bi bi-person-workspace"></i> <span>User Projects</span></a></li>
            <li><a href="TopThreePerformer.aspx"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
            
      </ul>
  </div>

   
    
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="title"><i class="bi bi-list-ol"></i> Subtasks Management</h1>
                <asp:LinkButton ID="RefreshButton" runat="server" CssClass="button">
                    <i class="bi bi-arrow-clockwise"></i> Refresh
                </asp:LinkButton>
            </div>

             <div class="data-container">
 <div class="data-header">
     <h2><i class="bi bi-table"></i> Subtasks List</h2>
     <p>Manage all system Subtasks from here</p>
 </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1" CssClass="grid-style">
                <Columns>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="button">
                                <i class="bi bi-pencil-square"></i> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="button"
                                OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
                    <asp:BoundField DataField="SUBTASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASK_ID" />
                    <asp:BoundField DataField="SUBTASK_NAME" HeaderText="Subtask Name" SortExpression="SUBTASK_NAME" />
                    <asp:BoundField DataField="SUBTASK_STATUS" HeaderText="Status" SortExpression="SUBTASK_STATUS" />
                    <asp:BoundField DataField="TASK_ID" HeaderText="Task ID" SortExpression="TASK_ID" />
                </Columns>
            </asp:GridView>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" 
                DataSourceID="SqlDataSource1" CssClass="form-view-container">
                <EditItemTemplate>
                    <div class="form-edit">
                        <h3><i class="bi bi-pencil-square"></i> Edit Subtask</h3>
                        <div class="form-group">
                            <label class="form-label">Subtask ID:</label>
                            <asp:Label ID="SUBTASK_IDLabel1" runat="server" Text='<%# Eval("SUBTASK_ID") %>' CssClass="form-id"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Subtask Name:</label>
                            <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status:</label>
                            <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Task ID:</label>
                            <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button">
                                <i class="bi bi-check-lg"></i> Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button">
                                <i class="bi bi-x-lg"></i> Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-insert">
                        <h3><i class="bi bi-plus-lg"></i> Add New Subtask</h3>
                        <div class="form-group">
                            <label class="form-label">Subtask ID:</label>
                            <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Subtask Name:</label>
                            <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status:</label>
                            <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Task ID:</label>
                            <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button">
                                <i class="bi bi-plus-lg"></i> Insert
                            </asp:LinkButton>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button">
                                <i class="bi bi-x-lg"></i> Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-view">
                        <div class="form-actions">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button">
                                <i class="bi bi-plus-lg"></i> Add New Subtask
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <!-- Original SqlDataSource remains unchanged -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASK_ID&quot; = :original_SUBTASK_ID AND ((&quot;SUBTASK_NAME&quot; = :original_SUBTASK_NAME) OR (&quot;SUBTASK_NAME&quot; IS NULL AND :original_SUBTASK_NAME IS NULL)) AND ((&quot;SUBTASK_STATUS&quot; = :original_SUBTASK_STATUS) OR (&quot;SUBTASK_STATUS&quot; IS NULL AND :original_SUBTASK_STATUS IS NULL)) AND ((&quot;TASK_ID&quot; = :original_TASK_ID) OR (&quot;TASK_ID&quot; IS NULL AND :original_TASK_ID IS NULL))" 
                InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASK_ID&quot;, &quot;SUBTASK_NAME&quot;, &quot;SUBTASK_STATUS&quot;, &quot;TASK_ID&quot;) VALUES (:SUBTASK_ID, :SUBTASK_NAME, :SUBTASK_STATUS, :TASK_ID)" 
                OldValuesParameterFormatString="original_{0}" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;SUBTASK_ID&quot;, &quot;SUBTASK_NAME&quot;, &quot;SUBTASK_STATUS&quot;, &quot;TASK_ID&quot; FROM &quot;SUBTASK&quot;" 
                UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASK_NAME&quot; = :SUBTASK_NAME, &quot;SUBTASK_STATUS&quot; = :SUBTASK_STATUS, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;SUBTASK_ID&quot; = :original_SUBTASK_ID AND ((&quot;SUBTASK_NAME&quot; = :original_SUBTASK_NAME) OR (&quot;SUBTASK_NAME&quot; IS NULL AND :original_SUBTASK_NAME IS NULL)) AND ((&quot;SUBTASK_STATUS&quot; = :original_SUBTASK_STATUS) OR (&quot;SUBTASK_STATUS&quot; IS NULL AND :original_SUBTASK_STATUS IS NULL)) AND ((&quot;TASK_ID&quot; = :original_TASK_ID) OR (&quot;TASK_ID&quot; IS NULL AND :original_TASK_ID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
                    <asp:Parameter Name="original_SUBTASK_NAME" Type="String" />
                    <asp:Parameter Name="original_SUBTASK_STATUS" Type="String" />
                    <asp:Parameter Name="original_TASK_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                    <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                    <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="Decimal" />
                    <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
                    <asp:Parameter Name="original_SUBTASK_NAME" Type="String" />
                    <asp:Parameter Name="original_SUBTASK_STATUS" Type="String" />
                    <asp:Parameter Name="original_TASK_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>