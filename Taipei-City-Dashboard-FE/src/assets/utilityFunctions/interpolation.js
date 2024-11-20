// This function estimates the values at target points based on the values at nearby data points,
// taking into account the distances between them. The weighted average ensures that closer data
// points have a stronger influence on the interpolated value.

// Input:
// 1. dataPoints
// An array that contains n objects in the format of {x, y, value}
// 2. targetPoints
// An array that contains m objects in the format of {x, y}
//
// Output:
// 1. answers
// An array that contains m values, representing the predicted value on each of the target coordinates.

export function interpolation(dataPoints, targetPoints) {
	let answers = [];

	// Early return for invalid inputs
	if (!Array.isArray(dataPoints) || !Array.isArray(targetPoints)) {
		return answers;
	}

	// Set maximum limits for data points to prevent excessive processing
	const MAX_DATA_POINTS = 1000;
	const MAX_TARGET_POINTS = 10000;
	
	// Limit the number of points to process
	const limitedDataPoints = dataPoints.slice(0, MAX_DATA_POINTS);
	const limitedTargetPoints = targetPoints.slice(0, MAX_TARGET_POINTS);
	
	const pointCount = limitedDataPoints.length;

	for (let k = 0; k < limitedTargetPoints.length; k++) {
		if (k >= limitedTargetPoints.length) break;

		if (limitedDataPoints.includes(limitedTargetPoints[k])) {
			answers.push(limitedDataPoints[limitedDataPoints.indexOf(limitedTargetPoints[k])].value);
		} else {
			let weight_sum = 0;
			let weight_value = 0;
			for (let i = 0; i < pointCount; i++) {
				const distance = (limitedDataPoints[i].x - limitedTargetPoints[k].x) ** 2 +
					(limitedDataPoints[i].y - limitedTargetPoints[k].y) ** 2;
				const weight = distance === 0 ? 1 : 1 / distance;  // Prevent division by zero
				weight_sum += weight;
				weight_value += weight * (isNaN(limitedDataPoints[i].value) ? 0 : limitedDataPoints[i].value);
			}
			weight_value = weight_sum !== 0 ? weight_value / weight_sum : 0;  // Prevent division by zero
			answers.push(weight_value);
		}
	}
	return answers;
}
