<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" />
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
        .main-content {
            margin-left: 280px;
            padding: 30px;
            flex: 1;
            transition: all 0.3s ease;
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

        .header h1 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .header-actions {
            display: flex;
            gap: 15px;
        }

        .header-actions button {
            background-color: var(--dark-color);
            border: none;
            color: var(--text-light);
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }

        .header-actions button:hover {
            background-color: var(--darker-color);
            transform: translateY(-2px);
        }

        .header-actions button i {
            margin-right: 5px;
            font-size: 1.1rem;
        }

        .summary-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 1.2rem;
            color: var(--primary-color);
            margin-bottom: 15px;
            font-weight: 500;
            border-left: 3px solid var(--primary-color);
            padding-left: 10px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: var(--card-bg);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid var(--card-border);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            border-color: var(--primary-color);
        }

        .card h3 {
            margin-top: 0;
            color: var(--text-muted);
            font-size: 1rem;
            font-weight: 500;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        }

        .card-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background-color: var(--orange-glow);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            border: 2px solid var(--primary-color);
        }

        .card-icon i {
            font-size: 1.8rem;
            color: var(--primary-color);
        }

        .links-card {
            padding: 20px;
            text-align: center;
        }

        .links-card a {
            display: inline-block;
            padding: 12px 18px;
            margin: 5px;
            background-color: var(--primary-color);
            color: var(--text-light);
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .links-card a:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 1024px) {
            .sidebar {
                width: 80px;
                padding: 15px 0;
            }
            
            .sidebar-brand {
                padding: 10px;
                text-align: center;
            }
            
            .sidebar h2, .sidebar p {
                display: none;
            }
            
            .sidebar ul li a {
                padding: 15px;
                justify-content: center;
            }
            
            .sidebar ul li a i {
                margin-right: 0;
                font-size: 1.4rem;
            }
            
            .sidebar ul li a span {
                display: none;
            }
            
            .main-content {
                margin-left: 80px;
            }
        }

        @media (max-width: 768px) {
            .cards {
                grid-template-columns: 1fr;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .header-actions {
                margin-top: 15px;
                width: 100%;
            }
            
            .header-actions button {
                flex: 1;
                justify-content: center;
            }
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
            <li><a href="Dashboard.aspx" class="active"><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
            <li><a href="User.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
            <li><a href="Project.aspx"><i class="bi bi-kanban-fill"></i> <span>Projects</span></a></li>
            <li><a href="Task.aspx"><i class="bi bi-list-check"></i> <span>Tasks</span></a></li>
            <li><a href="Subtask.aspx"><i class="bi bi-card-checklist"></i> <span>Subtasks</span></a></li>
            <li><a href="Milestone.aspx"><i class="bi bi-flag-fill"></i> <span>Milestones</span></a></li>
            <li><a href="UserProjects.aspx"><i class="bi bi-person-workspace"></i> <span>Users Project</span></a></li>
<li><a href="UserTasks.aspx"><i class="bi bi-clipboard-check"></i> <span>Users Task</span></a></li>
            <li><a href="UserAndProject.aspx"><i class="bi bi-person-workspace"></i> <span>User Projects</span></a></li>
            <li><a href="TopThreePerformer.aspx"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
            
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <form id="form1" runat="server">
            <div class="header">
                <div>
                    <h1>Project Management Dashboard</h1>
                    <p>Overview of your project metrics and performance</p>
                </div>
                <div class="header-actions">
                    <button type="button"><i class="bi bi-arrow-clockwise"></i> Refresh</button>
                    <button type="button"><i class="bi bi-download"></i> Export</button>
                </div>
            </div>

            <div class="summary-section">
                <h2 class="section-title">Project Overview</h2>
                <div class="cards">
                    <div class="card">
                        <div class="card-icon">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <h3>Total Users</h3>
                        <p><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></p>
                    </div>
                    <div class="card">
                        <div class="card-icon">
                            <i class="bi bi-kanban-fill"></i>
                        </div>
                        <h3>Total Projects</h3>
                        <p><asp:Label ID="lblTotalProjects" runat="server" Text="0"></asp:Label></p>
                    </div>
                    <div class="card">
                        <div class="card-icon">
                            <i class="bi bi-list-check"></i>
                        </div>
                        <h3>Active Tasks</h3>
                        <p><asp:Label ID="lblActiveTasks" runat="server" Text="0"></asp:Label></p>
                    </div>
                    <div class="card">
                        <div class="card-icon">
                            <i class="bi bi-flag-fill"></i>
                        </div>
                        <h3>Upcoming Milestones</h3>
                        <p><asp:Label ID="lblUpcomingMilestones" runat="server" Text="0"></asp:Label></p>
                    </div>
                    <div class="card">
                        <div class="card-icon">
                            <i class="bi bi-trophy-fill"></i>
                        </div>
                        <h3>Top Performer</h3>
                        <p><asp:Label ID="lblTopPerformer" runat="server" Text="N/A"></asp:Label></p>
                    </div>
                </div>
            </div>

            <div class="summary-section">
                <h2 class="section-title">Quick Links</h2>
                <div class="cards">
                    <div class="card links-card">
                        <div class="card-icon">
                            <i class="bi bi-link-45deg"></i>
                        </div>
                        <h3>Related Pages</h3>
                        <div>
                            <asp:HyperLink ID="TASK_ASSIGNMENTSLink" runat="server" NavigateUrl="~/TASK_ASSIGNMENTS.aspx">Task Assignments</asp:HyperLink>
                            <asp:HyperLink ID="USER_PROJECTLink" runat="server" NavigateUrl="~/USER_PROJECT.aspx">User Projects</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>