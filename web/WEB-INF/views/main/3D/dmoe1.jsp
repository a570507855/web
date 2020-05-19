<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>标题</title>
    <jsp:include page="/views/resources"/>
    <script typeof="text/javascript" charset="UTF-8" src="/js/webgl/gl-matrix.js" ></script>
</head>
<body>
<jsp:include page="/views/head"/>

<canvas id="canvas" width="500" height="500"></canvas>
<jsp:include page="/views/footer"/>
</body>
<script>
    let gl = document.getElementById("canvas").getContext("webgl");
    if(!gl){
        alert("浏览器不支持webgl！！！")
    }
    else{
        gl.clearColor(0,0,0,1);
        gl.clear(gl.COLOR_BUFFER_BIT);

        //顶点着色器
        const vsSource = `
    attribute vec4 aVertexPosition;

    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;

    void main() {
      gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
    }
  `;
        //片段着色器
        const fsSource = `
    void main() {
      gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
    }
  `;
        //创建着色器程序
        const shaderProgram = initShaderProgram(gl, vsSource, fsSource);
        const programInfo = {
            program: shaderProgram,
            attribLocations: {
                vertexPosition: gl.getAttribLocation(shaderProgram, 'aVertexPosition'),
            },
            uniformLocations: {
                projectionMatrix: gl.getUniformLocation(shaderProgram, 'uProjectionMatrix'),
                modelViewMatrix: gl.getUniformLocation(shaderProgram, 'uModelViewMatrix'),
            },
        };

        drawScene(gl,shaderProgram,initBuffers(gl));

        function initShaderProgram(gl,vsSource,fsSource) {
            const vertexShader = loadShader(gl,gl.VERTEX_SHADER,vsSource);
            const fragmentShader = loadShader(gl,gl.FRAGMENT_SHADER,fsSource);

            //创建着色器程序
            const shaderProgram = gl.createProgram();
            gl.attachShader(shaderProgram,vertexShader);
            gl.attachShader(shaderProgram,fragmentShader);
            gl.linkProgram(shaderProgram);

            if(!gl.getProgramParameter(shaderProgram,gl.LINK_STATUS)){
                alert("初始化着色器失败：" + gl.getShaderInfoLog(shaderProgram));
                return null;
            }
            return shaderProgram;
        }

        //创建指定类型的着色器，上传source源码并编译
        function loadShader(gl,type,source) {
            const shader = gl.createShader(type);
            gl.shaderSource(shader,source);
            gl.compileShader(shader);
            if(!gl.getShaderParameter(shader,gl.COMPILE_STATUS)){
                alert("编译出错：" + gl.getShaderInfoLog(shader));
                gl.deleteShader(shader);
                return null;
            }
            return shader;
        }

        //初始化缓冲器
        function initBuffers(gl) {
            const positionBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER,positionBuffer);
            let vertices = [
                1.0,  1.0,  0.0,
                -1.0, 1.0,  0.0,
                1.0,  -1.0, 0.0,
                -1.0, -1.0, 0.0
            ];
            gl.bufferData(gl.ARRAY_BUFFER,new Float32Array(vertices),gl.STATIC_DRAW);
            return {
                position:positionBuffer
            }
        }

        //绘制场景
        function drawScene(gl,program,buffers) {
            gl.clearColor(0.0,0.0,0.0,1.0);
            gl.clearDepth(1);
            gl.enable(gl.DEPTH_TEST);
            gl.depthFunc(gl.LEQUAL);

            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

            const fieldOfView = 45 * Math.PI / 180;   // in radians
            const aspect = gl.canvas.clientWidth / gl.canvas.clientHeight;
            const zNear = 0.1;
            const zFar = 100.0;
            const projectionMatrix = mat4.create();

            mat4.perspective(projectionMatrix,
                fieldOfView,
                aspect,
                zNear,
                zFar);
            const modelViewMatrix = mat4.create();
            mat4.translate(modelViewMatrix,
                modelViewMatrix,
                [-0.0, 0.0, -6.0]);

            {
                const numComponents = 3;
                const type = gl.FLOAT;
                const normalize = false;
                const stride = 0;
                const offset = 0;

                gl.bindBuffer(gl.ARRAY_BUFFER, buffers.position);
                gl.vertexAttribPointer(
                    programInfo.attribLocations.vertexPosition,
                    numComponents,
                    type,
                    normalize,
                    stride,
                    offset);
                gl.enableVertexAttribArray(programInfo.attribLocations.vertexPosition);
            }

            gl.useProgram(programInfo.program);

            // Set the shader uniforms

            gl.uniformMatrix4fv(
                programInfo.uniformLocations.projectionMatrix,
                false,
                projectionMatrix);
            gl.uniformMatrix4fv(
                programInfo.uniformLocations.modelViewMatrix,
                false,
                modelViewMatrix);

            {
                const offset = 0;
                const vertexCount = 4;
                gl.drawArrays(gl.TRIANGLE_STRIP, offset, vertexCount);
            }
        }
    }




</script>
</html>
