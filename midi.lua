
function onShortMessage(status, data1, data2)
	if (status & 0xF0) == 0x80 then
		print("Note on!");

		-- Max velocity
		data1 = 0x7F;
	--elseif (status & 0xF0) == 0x
	end

	return status, data1, data2;
end

function onSysExMessage(data)
	-- Pass through
	return data;
end

status, data1, data2 = onShortMessage(0x82, 0x1F, 0x7F);

print(string.format("0x%02X%02X%02X", status, data1, data2));
