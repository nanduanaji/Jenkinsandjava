<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>DevOps Platform | v1</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background:
                radial-gradient(circle at top left, #182848 0%, transparent 35%),
                radial-gradient(circle at bottom right, #0f2027 0%, transparent 40%),
                #070b12;
            color: #e6edf3;
            min-height: 100vh;
        }

        /* Navigation */

        .navbar {
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            border-bottom: 1px solid #1d2633;
            background: rgba(7, 11, 18, 0.85);
            backdrop-filter: blur(12px);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .logo-icon {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            font-weight: bold;
            color: white;
        }

        .version {
            font-size: 12px;
            padding: 5px 10px;
            border: 1px solid #263241;
            border-radius: 20px;
            color: #8b9bb0;
        }

        /* Hero */

        .hero {
            max-width: 1150px;
            margin: auto;
            padding: 90px 30px 50px;
            text-align: center;
        }

        .status {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 15px;
            border-radius: 25px;
            background: rgba(46, 160, 67, 0.12);
            border: 1px solid rgba(46, 160, 67, 0.35);
            color: #3fb950;
            font-size: 13px;
            margin-bottom: 25px;
        }

        .status-dot {
            width: 8px;
            height: 8px;
            background: #3fb950;
            border-radius: 50%;
            box-shadow: 0 0 10px #3fb950;
        }

        h1 {
            font-size: clamp(42px, 7vw, 78px);
            line-height: 1;
            margin-bottom: 25px;
            background: linear-gradient(
                90deg,
                #ffffff,
                #8bdcff,
                #6c8cff
            );
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .subtitle {
            max-width: 700px;
            margin: auto;
            color: #8b98a9;
            font-size: 18px;
            line-height: 1.7;
        }

        .highlight {
            color: #58a6ff;
            font-weight: 600;
        }

        /* Pipeline */

        .pipeline {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 30px;
        }

        .pipeline-title {
            text-align: center;
            margin-bottom: 25px;
            color: #8b98a9;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        .pipeline-flow {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 12px;
        }

        .stage {
            position: relative;
            padding: 25px 15px;
            text-align: center;
            background: rgba(17, 24, 39, 0.75);
            border: 1px solid #263241;
            border-radius: 14px;
            transition: 0.3s;
        }

        .stage:hover {
            transform: translateY(-5px);
            border-color: #2684ff;
            box-shadow: 0 10px 30px rgba(0, 114, 255, 0.12);
        }

        .stage-icon {
            font-size: 28px;
            margin-bottom: 12px;
        }

        .stage-name {
            font-weight: 600;
            font-size: 14px;
        }

        .stage-status {
            color: #3fb950;
            font-size: 11px;
            margin-top: 7px;
        }

        /* Architecture */

        .architecture {
            max-width: 1100px;
            margin: 70px auto;
            padding: 0 30px;
        }

        .architecture h2 {
            text-align: center;
            margin-bottom: 35px;
            font-size: 28px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: linear-gradient(
                145deg,
                rgba(20, 29, 42, 0.95),
                rgba(10, 15, 23, 0.95)
            );
            border: 1px solid #263241;
            border-radius: 16px;
            padding: 30px;
            transition: 0.3s;
        }

        .card:hover {
            border-color: #3b82f6;
            transform: translateY(-4px);
        }

        .card-icon {
            font-size: 30px;
            margin-bottom: 18px;
        }

        .card h3 {
            margin-bottom: 12px;
        }

        .card p {
            color: #8290a3;
            line-height: 1.6;
            font-size: 14px;
        }

        /* Metrics */

        .metrics {
            max-width: 1000px;
            margin: 60px auto;
            padding: 0 30px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }

        .metric {
            padding: 22px;
            background: #0d131c;
            border: 1px solid #202b38;
            border-radius: 12px;
            text-align: center;
        }

        .metric-value {
            font-size: 26px;
            font-weight: 700;
            color: #58a6ff;
        }

        .metric-label {
            margin-top: 6px;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #6f7d8f;
        }

        /* Footer */

        footer {
            margin-top: 80px;
            border-top: 1px solid #1d2633;
            padding: 30px;
            text-align: center;
            color: #596575;
            font-size: 13px;
        }

        .footer-highlight {
            color: #58a6ff;
        }

        @media (max-width: 800px) {

            .pipeline-flow {
                grid-template-columns: repeat(2, 1fr);
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .metrics {
                grid-template-columns: repeat(2, 1fr);
            }

            .hero {
                padding-top: 60px;
            }
        }

        @media (max-width: 500px) {

            .pipeline-flow {
                grid-template-columns: 1fr;
            }

            .metrics {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 0 20px;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation -->

    <nav class="navbar">

        <div class="logo">
            <div class="logo-icon">D</div>
            DEVOPS PLATFORM
        </div>

        <div class="version">
            RELEASE v2.0
        </div>

    </nav>


    <!-- Hero -->

    <section class="hero">

        <div class="status">
            <span class="status-dot"></span>
            SYSTEM OPERATIONAL
        </div>

        <h1>Hello DevOps v2</h1>

        <p class="subtitle">
            Welcome to the <span class="highlight">Java DevOps Platform</span>.
            This application is automatically built, containerized,
            pushed to the registry and deployed to Kubernetes through
            a CI/CD pipeline.
        </p>

    </section>


    <!-- CI/CD Pipeline -->

    <section class="pipeline">

        <div class="pipeline-title">
            Continuous Delivery Pipeline
        </div>

        <div class="pipeline-flow">

            <div class="stage">
                <div class="stage-icon">⌘</div>
                <div class="stage-name">GitHub</div>
                <div class="stage-status">● CONNECTED</div>
            </div>

            <div class="stage">
                <div class="stage-icon">⚙</div>
                <div class="stage-name">Jenkins</div>
                <div class="stage-status">● BUILD READY</div>
            </div>

            <div class="stage">
                <div class="stage-icon">◈</div>
                <div class="stage-name">Docker</div>
                <div class="stage-status">● IMAGE BUILT</div>
            </div>

            <div class="stage">
                <div class="stage-icon">☁</div>
                <div class="stage-name">Amazon ECR</div>
                <div class="stage-status">● IMAGE PUSHED</div>
            </div>

            <div class="stage">
                <div class="stage-icon">⎈</div>
                <div class="stage-name">Kubernetes</div>
                <div class="stage-status">● DEPLOYED</div>
            </div>

        </div>

    </section>


    <!-- Architecture -->

    <section class="architecture">

        <h2>Platform Architecture</h2>

        <div class="cards">

            <div class="card">

                <div class="card-icon">⚙️</div>

                <h3>Continuous Integration</h3>

                <p>
                    Jenkins automatically pulls source code from GitHub,
                    executes the Maven build and packages the Java
                    application into a deployable artifact.
                </p>

            </div>


            <div class="card">

                <div class="card-icon">🐳</div>

                <h3>Containerization</h3>

                <p>
                    The application is packaged into a lightweight
                    Docker container running Apache Tomcat and Java 8,
                    providing a consistent runtime environment.
                </p>

            </div>


            <div class="card">

                <div class="card-icon">☸️</div>

                <h3>Container Orchestration</h3>

                <p>
                    Kubernetes manages application replicas,
                    scheduling, service discovery and automated
                    workload deployment across the cluster.
                </p>

            </div>

        </div>

    </section>


    <!-- Metrics -->

    <section class="metrics">

        <div class="metric">
            <div class="metric-value">99.9%</div>
            <div class="metric-label">Availability</div>
        </div>

        <div class="metric">
            <div class="metric-value">2</div>
            <div class="metric-label">Replicas</div>
        </div>

        <div class="metric">
            <div class="metric-value">5</div>
            <div class="metric-label">Pipeline Stages</div>
        </div>

        <div class="metric">
            <div class="metric-value">v1.0</div>
            <div class="metric-label">Release</div>
        </div>

    </section>


    <!-- Footer -->

    <footer>

        <p>
            Java Application • Docker • Jenkins • Amazon ECR • Kubernetes
        </p>

        <p style="margin-top: 8px;">
            <span class="footer-highlight">DevOps New v1</span>
            &nbsp;|&nbsp;
            Automated Delivery Platform
        </p>

    </footer>

</body>
</html>
