/**
 * @name  Frame动作工具
 * @brief 处理Frame动作
 */
import BaseUtil from "@/BaseUtil";
import DataBase from "@/DataBase";
import MathUtil from "@/MathUtil";
export default class FrameActionUtil {
    /**
     * @brief 将Frame的位置移动(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x 位置x的变化量
     * @param y 位置y的变化量
     * @param callback 动作结束后的回调函数
     */
    static moveBy(frame, duration, x, y, callback) {
        assert(duration >= 0.01, 'moveBy持续时间不能小于0.01秒');
        let frameX = frame.getPoint()?.x ?? 0;
        let frameY = frame.getPoint()?.y ?? 0;
        let point = frame.getPoint()?.point ?? 4;
        let loopCount = R2I(duration / 0.01);
        let deltaX = 1.0 * x / loopCount;
        let deltaY = 1.0 * y / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameX += deltaX;
            frameY += deltaY;
            frame.clearPoints();
            frame.setAbsPoint(point, frameX, frameY);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame的位置移动到(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x Frame的最终x位置
     * @param y Frame的最终y位置
     * @param callback 动作结束后的回调函数
     */
    static moveTo(frame, duration, x, y, callback) {
        assert(duration >= 0.01, 'moveTo持续时间不能小于0.01秒');
        let frameX = frame.getPoint()?.x ?? 0;
        let frameY = frame.getPoint()?.y ?? 0;
        let point = frame.getPoint()?.point ?? 4;
        let distance = MathUtil.distanceBetweenPoints(frameX, frameY, x, y);
        let angle = MathUtil.angleBetweenCoords(frameX, frameY, x, y);
        let loopCount = R2I(duration / 0.01);
        let deltaX = distance * CosBJ(angle) / loopCount;
        let deltaY = distance * SinBJ(angle) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameX += deltaX;
            frameY += deltaY;
            frame.clearPoints();
            frame.setAbsPoint(point, frameX, frameY);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame的尺寸变化(w,h)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param w 宽度的变化量
     * @param h 高度的变化量
     * @param callback 动作结束后的回调函数
     */
    static resizeBy(frame, duration, w, h, callback) {
        assert(duration >= 0.01, 'resizeBy持续时间不能小于0.01秒');
        let width = frame.width ?? 0;
        let height = frame.height ?? 0;
        let loopCount = R2I(duration / 0.01);
        let deltaW = 1.0 * w / loopCount;
        let deltaH = 1.0 * h / loopCount;
        BaseUtil.onTimer(0.01, count => {
            width += deltaW;
            height += deltaH;
            frame.setSize(width, height);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame的尺寸变化到(w,h)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param w Frame的最终宽度
     * @param h Frame的最终高度
     * @param callback 动作结束后的回调函数
     */
    static resizeTo(frame, duration, width, height, callback) {
        assert(duration >= 0.01, 'resizeTo持续时间不能小于0.01秒');
        let frameWidth = frame.width ?? 0;
        let frameHeight = frame.height ?? 0;
        let loopCount = R2I(duration / 0.01);
        let deltaW = 1.0 * (width - frameWidth) / loopCount;
        let deltaH = 1.0 * (height - frameHeight) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameWidth += deltaW;
            frameHeight += deltaH;
            frame.setSize(frameWidth, frameHeight);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame缩放(scale)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param scale 缩放的变化量
     * @param callback 动作结束后的回调函数
     */
    static scaleBy(frame, duration, scale, callback) {
        assert(duration >= 0.01, 'scaleBy持续时间不能小于0.01秒');
        let frameScale = frame.getScale() ?? 1.0;
        let loopCount = R2I(duration / 0.01);
        let deltaScale = 1.0 * scale / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameScale += deltaScale;
            frame.setScale(frameScale);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame缩放到(scale)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param scale Frame的最终缩放
     * @param callback 动作结束后的回调函数
     */
    static scaleTo(frame, duration, scale, callback) {
        assert(duration >= 0.01, 'scaleTo持续时间不能小于0.01秒');
        let frameScale = frame.getScale() ?? 1.0;
        let loopCount = R2I(duration / 0.01);
        let deltaScale = 1.0 * (scale - frameScale) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameScale += deltaScale;
            frame.setScale(frameScale);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame闪烁times次
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param times 闪烁的次数
     * @param callback 动作结束后的回调函数
     */
    static blink(frame, duration, times, callback) {
        assert(duration >= 0.01, 'blink持续时间不能小于0.01秒');
        let frameVisible = frame.visible;
        BaseUtil.onTimer(0.01, count => {
            let slice = 1.0 / times;
            let m = ModuloReal(0.01 * count, slice);
            frame.setVisible(m > slice / 2 ? true : false);
            if (0.01 * count >= duration) {
                frame.setVisible(frameVisible);
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 淡入淡出到透明度alpha
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param alpha Frame的最终透明度
     * @param callback 动作结束后的回调函数
     */
    static fadeTo(frame, duration, alpha, callback) {
        assert(duration >= 0.01, 'fadeTo持续时间不能小于0.01秒');
        let frameAlpha = frame.alpha;
        let loopCount = R2I(duration / 0.01);
        let deltaAlpha = 1.0 * (alpha - frameAlpha) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameAlpha += deltaAlpha;
            frame.setAlpha(frameAlpha);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 淡入
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param callback 动作结束后的回调函数
     */
    static fadeIn(frame, duration, callback) {
        this.fadeTo(frame, duration, 255, callback);
    }
    /**
     * @brief 淡出
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param callback 动作结束后的回调函数
     */
    static fadeOut(frame, duration, callback) {
        this.fadeTo(frame, duration, 0, callback);
    }
    /**
     * @brief 动画
     * @param frame 执行动作的Frame,必须是backdrop
     * @param textures 动画纹理集
     * @param interval 间隔时间
     * @param loopCount 循环次数
     * @param isRestore 是否恢复到初始纹理
     * @param callback 动作结束后的回调函数
     */
    static animate(frame, textures, interval, loopCount = -1, isRestore = true, callback) {
        if (textures.length <= 0)
            return;
        let frameTexture = frame.getTexture();
        let index = 0;
        let execCount = 0;
        BaseUtil.onTimer(interval, () => {
            index++;
            if (index < textures.length) {
                let texture = textures[index];
                frame.setTexture(texture);
                if (index == textures.length - 1) {
                    execCount++;
                    index = 0;
                }
            }
            if (execCount == loopCount) {
                if (isRestore) {
                    frame.setTexture(frameTexture);
                }
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief Frame跳跃一段距离(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x 位置x的变化量
     * @param y 位置y的变化量
     * @param height 跳跃高度
     * @param jumps 跳跃次数
     * @param callback 动作结束后的回调函数
     */
    static jumpBy(frame, duration, x, y, height, jumps, callback) {
        assert(duration >= 0.01, 'jumpBy持续时间不能小于0.01秒');
        assert(jumps >= 0, 'jumpBy跳跃次数不能小于0');
        let frameX = frame.getPoint()?.x ?? 0;
        let frameY = frame.getPoint()?.y ?? 0;
        let point = frame.getPoint()?.point ?? 4;
        BaseUtil.onTimer(0.01, count => {
            let escapedTime = 0.01 * count;
            let xx = x * escapedTime * (1.0 / duration);
            let frac = ModuloReal(escapedTime * jumps, 1.0);
            let yy = height * 4 * frac * (1 - frac);
            yy += y * escapedTime * (1.0 / duration);
            frame.clearPoints();
            frame.setAbsPoint(point, frameX + xx, frameY + yy);
            if (escapedTime >= duration) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief Frame跳跃一段距离到(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x Frame的最终x位置
     * @param y Frame的最终y位置
     * @param height 跳跃高度
     * @param jumps 跳跃次数
     * @param callback 动作结束后的回调函数
     */
    static jumpTo(frame, duration, x, y, height, jumps, callback) {
        assert(duration >= 0.01, 'jumpTo持续时间不能小于0.01秒');
        assert(jumps >= 0, 'jumpTo跳跃次数不能小于0');
        let frameX = frame.getPoint()?.x ?? 0;
        let frameY = frame.getPoint()?.y ?? 0;
        let deltaX = x - frameX;
        let deltaY = y - frameY;
        this.jumpBy(frame, duration, deltaX, deltaY, height, jumps, callback);
    }
    /**
     * @brief 将Frame的位置按贝塞尔曲线移动某一位置
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param bezierConfig 贝塞尔曲线配置
     * @param callback 动作结束后的回调函数
     */
    static bezierBy(frame, duration, bezierConfig, callback) {
        assert(duration >= 0.01, 'bezierBy持续时间不能小于0.01秒');
        let frameX = frame.getPoint()?.x ?? 0;
        let frameY = frame.getPoint()?.y ?? 0;
        let point = frame.getPoint()?.point ?? 4;
        BaseUtil.onTimer(0.01, count => {
            let escapedTime = 0.01 * count;
            let xa = 0;
            let xb = bezierConfig.controlPoint_1.x;
            let xc = bezierConfig.controlPoint_2.x;
            let xd = bezierConfig.endPosition.x;
            let ya = 0;
            let yb = bezierConfig.controlPoint_1.y;
            let yc = bezierConfig.controlPoint_2.y;
            let yd = bezierConfig.endPosition.y;
            let x = this.bezierAt(xa, xb, xc, xd, escapedTime);
            let y = this.bezierAt(ya, yb, yc, yd, escapedTime);
            frame.clearPoints();
            frame.setAbsPoint(point, frameX + x, frameY + y);
            if (escapedTime >= duration) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame的位置按贝塞尔曲线移动到某一位置
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param bezierConfig 贝塞尔曲线配置
     * @param callback 动作结束后的回调函数
     */
    static bezierTo(frame, duration, bezierConfig, callback) {
        assert(duration >= 0.01, 'bezierTo持续时间不能小于0.01秒');
        let frameX = frame.getPoint()?.x ?? 0;
        let frameY = frame.getPoint()?.y ?? 0;
        let bc = {
            controlPoint_1: {
                x: bezierConfig.controlPoint_1.x - frameX,
                y: bezierConfig.controlPoint_1.y - frameY,
            },
            controlPoint_2: {
                x: bezierConfig.controlPoint_2.x - frameX,
                y: bezierConfig.controlPoint_2.y - frameY,
            },
            endPosition: {
                x: bezierConfig.endPosition.x - frameX,
                y: bezierConfig.endPosition.y - frameY,
            },
        };
        this.bezierBy(frame, duration, bc, callback);
    }
    /**贝塞尔曲线*/
    static bezierAt(a, b, c, d, t) {
        return (math.pow(1 - t, 3) * a + 3 * t * (math.pow(1 - t, 2)) * b + 3 * math.pow(t, 2) * (1 - t) * c + math.pow(t, 3) * d);
    }
    /**
     * @brief 将Frame的色调变化某值
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param r 色调r的变化量
     * @param g 色调g的变化量
     * @param b 色调b的变化量
     * @param callback 动作结束后的回调函数
     */
    static tintBy(frame, duration, r, g, b, callback) {
        assert(duration >= 0.01, 'tintBy持续时间不能小于0.01秒');
        let frameData = DataBase.getDataByTypeId('Frame', tostring(frame.current), true);
        let frameR = frameData?.r ?? 0;
        let frameG = frameData?.g ?? 0;
        let frameB = frameData?.b ?? 0;
        let frameAlpha = frame.alpha;
        BaseUtil.onTimer(0.01, count => {
            let escapedTime = 0.01 * count;
            let rr = frameR + r * escapedTime;
            let gg = frameG + g * escapedTime;
            let bb = frameB + b * escapedTime;
            frameData.r = rr;
            frameData.g = gg;
            frameData.b = bb;
            let color = DzGetColor(rr, gg, bb, frameAlpha);
            frame.setVertexColor(color);
            if (escapedTime >= duration) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }
    /**
     * @brief 将Frame的色调变化到某值
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param r Frame的最终色调r
     * @param g Frame的最终色调g
     * @param b Frame的最终色调b
     * @param callback 动作结束后的回调函数
     */
    static tintTo(frame, duration, r, g, b, callback) {
        assert(duration >= 0.01, 'tintTo持续时间不能小于0.01秒');
        let frameData = DataBase.getDataByTypeId('Frame', tostring(frame.current), true);
        let frameR = frameData?.r ?? 0;
        let frameG = frameData?.g ?? 0;
        let frameB = frameData?.b ?? 0;
        let deltaR = r - frameR;
        let deltaG = g - frameG;
        let deltaB = b - frameB;
        this.tintBy(frame, duration, deltaR, deltaG, deltaB, callback);
    }
}
