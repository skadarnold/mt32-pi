function onShortMessage(status, data1, data2)
	statusNybble = status & 0xF0;
	channelNybble = status & 0x0F;

	-- Note On
	if statusNybble == 0x90 then
		-- -- Max velocity
		-- if (data2 > 0) then
		-- 	data2 = 0x7F;
		-- end

		-- Not percussison channel
		-- if channelNybble ~= 9 then
		-- 	-- Transpose +1
		-- 	data1 = data1 + 1;
		-- end

	-- Note Off
	elseif statusNybble == 0x80 then
		-- Not percussion channel
		-- if channelNybble ~= 9 then
		-- 	-- Transpose +1
		-- 	data1 = data1 + 1;
		-- end

	-- Control Change
	elseif statusNybble == 0xB0 then
		-- CC# 3 - Unused
		if data1 == 0x1F then
			-- Map to master volume control
			SetMasterVolume(data2 / 127 * 100);

			SendMIDIShortMessage(0x90, data2, 0x3F);
			return;
		end
	end

	return status, data1, data2;
end

function onSysExMessage(data)
	-- Pass through
	return data;
end
