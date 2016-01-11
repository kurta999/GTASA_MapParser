#include <a_samp>
#include <sscanf2>
#include <filemanager>

new gModels[30000];
//new bool:gModelsFree[20000];

new gTotalModelsConverted;

#define X_OFFSET 	-3150.0
#define Y_OFFSET    4150.0
#define Z_OFFSET    0

/*
#define X_OFFSET 	2099.99
#define Y_OFFSET    -4100
#define Z_OFFSET    0
*/
//#define COPY_FILES

stock IsIDFree(id)
{
	return ((id >= 2 && id <= 6) || id == 8 || id == 42 || id == 65 || id == 74 || id == 86 || id == 119 || id == 149 || id == 108 || (id >= 265 && id <= 273)
		|| id == 289 || id == 329 || id == 332 || id == 340 || id == 382 || id == 383 || id == 398 || id == 399 || (id >= 612 && id <= 614) || (id >= 662 && id <= 663)
		|| (id >= 793 && id <= 799) || (id >= 907 && id <= 909) || id == 965 || id == 999 || (id >= 1194 && id <= 1206) || id == 1326 || id == 1573 || id == 1699
		|| (id >= 2883 && id <= 2884) || (id >= 3136 && id <= 3166) || (id >= 3176 && id <= 3177) || (id >= 3179 && id <= 3186) || (id >= 3188 && id <= 3192)
		|| (id >= 3194 && id <= 3213) || (id >= 3215 && id <= 3220) || (id >= 3222 && id <= 3240) || id == 3245 || (id >= 3247 && id <= 3248) || id == 3251 || id == 3254 || id == 3266
		|| (id >= 3348 && id <= 3349) || id == 3416 || id == 3429 || (id >= 3610 && id <= 3611) || id == 3784 || (id >= 3870 && id <= 3871) || id == 3883 || id == 3889 || (id >= 3892 && id <= 3923)
		|| id == 3974 || (id >= 4542 && id <= 4549) || (id >= 4763 && id <= 4805) || id == 5085 || (id >= 5090 && id <= 5104) || (id >= 5376 && id <= 5389) || (id >= 5683 && id <= 5702)
		|| (id >= 6011 && id <= 6034) || id == 6254 || (id >= 6258 && id <= 6279) || id == 6348 || (id >= 6526 && id <= 6862) || (id >= 7393 && id <= 7414)
		|| (id >= 7974 && id <= 7977) || (id >= 9194 && id <= 9204) || id == 9268 || (id >= 9479 && id <= 9481) || (id >= 10311 && id <= 10314)
		|| (id >= 10745 && id <= 10749) || (id >= 11418 && id <= 11419) || (id >= 11753 && id <= 12799) || (id >= 13564 && id <= 13589) || (id >= 13668 && id <= 13671)
		|| (id >= 13891 && id <= 14382) || id == 14529 || id == 14555 || id == 14557 || id == 14559 || (id >= 14644 && id <= 14649) || (id >= 14658 && id <= 14659)
		|| (id >= 14696 && id <= 14698) || (id >= 14729 && id <= 14734) || (id >= 14766 && id <= 14769) || id == 14857 || id == 14884 || id == 14899
		|| (id >= 14904 && id <= 15024) || (id >= 15065 && id <= 15999) || (id >= 16791 && id <= 16999) || (id >= 17475 && id <= 17499) || id == 17975 || id == 17977
		|| (id >= 17979 && id <= 17999) || id == 18037 || id == 18103 || (id >= 18106 && id <= 18108) || (id >= 18110 && id <= 18111) || (id >= 18113 && id <= 18199) || (id >= 18860 && id <= 18861) || id == 19199 || (id >= 19275 && id <= 19276) || id == 19596);
}

new gStart = 0;
stock GetNextModel()
{
	if(IsIDFree(gStart)) return gStart;

	do
	{
        gStart++;
	}
	while(!IsIDFree(gStart) && gStart < 19596);

	return gStart;
}

public OnFilterScriptInit()
{

    SSCANF_Init(MAX_PLAYERS, INVALID_PLAYER_ID, MAX_PLAYER_NAME);
/*
	LoadIDE("VC_generic");
	LoadIPL("VC_generics0");
	LoadIPL("VC_generics1");
	LoadIPL("VC_generics2");
	LoadIPL("VC_generics3");
	LoadIPL("VC_generics4");
	LoadIDE("airport");
	LoadIPL("airport");
	LoadIDE("airportN");
	LoadIPL("airportN");
	LoadIDE("bank");
	LoadIPL("bank");
	LoadIDE("bridge");
	LoadIPL("bridge");
	LoadIDE("cisland");
	LoadIPL("cisland");
	LoadIDE("club");
	LoadIPL("club");
	LoadIDE("concerth");
	LoadIPL("concerth");
	LoadIDE("docks");
	LoadIPL("docks");
	LoadIDE("downtown");
	LoadIPL("downtown");
//	LoadIDE("downtows");
//	LoadIPL("downtows");
	LoadIDE("golf");
	LoadIPL("golf");
	LoadIDE("lawyers");
	LoadIPL("lawyers");
	LoadIDE("littleha");
	LoadIPL("littleha");
	LoadIDE("mall");
	LoadIPL("mall");
	LoadIDE("nbeach");
	LoadIPL("nbeach");
	LoadIDE("nbeachbt");
	LoadIPL("nbeachbt");
	LoadIDE("nbeachw");
	LoadIPL("nbeachw");
	LoadIDE("oceandn");
	LoadIPL("oceandn");
	LoadIDE("oceandrv");
	LoadIPL("oceandrv");
	LoadIDE("washintn");
	LoadIPL("washintn");
	LoadIDE("washints");
	LoadIPL("washints");
	LoadIDE("stripclb");
	LoadIPL("stripclb");
	LoadIDE("yacht");
	LoadIPL("yacht");

	LoadIDE("downtows");
	LoadIPL("downtows");
	LoadIDE("haiti");
	LoadIPL("haiti");
	LoadIDE("haitin");
	LoadIPL("haitin");
	LoadIDE("hotel");
	LoadIPL("hotel");
	LoadIDE("islandsf");
	LoadIPL("islandsf");
	LoadIDE("mansion");
	LoadIPL("mansion");
	LoadIDE("stadint");
	LoadIPL("stadint");
	LoadIDE("starisl");
	LoadIPL("starisl");
*/

	LoadMap("VC_generic");
	LoadMap("airport");
	LoadMap("airportN");
	LoadMap("bank");
	LoadMap("bridge");
	LoadMap("cisland");
	LoadMap("club");
	LoadMap("concerth");
	LoadMap("docks");
	LoadMap("downtown");
	LoadMap("downtows");
	LoadMap("golf");
	LoadMap("haiti");
	LoadMap("haitin");
	LoadMap("hotel");
	LoadMap("islandsf");
	LoadMap("lawyers");
	LoadMap("littleha");
	LoadMap("mall");
	LoadMap("mansion");
	LoadMap("nbeach");
	LoadMap("nbeachbt");
	LoadMap("nbeachw");
	LoadMap("oceandn");
	LoadMap("oceandrv");
	LoadMap("stadint");
	LoadMap("starisl");
	LoadMap("stripclb");
	LoadMap("washintn");
	//LoadMap("yacht");
	LoadMap("washints");

	LoadIPL("VC_generics0");
	LoadIPL("VC_generics1");
	LoadIPL("VC_generics2");
	LoadIPL("VC_generics3");
	LoadIPL("VC_generics4");
	LoadIPL("VC_Cull");
/*
	LoadIPL("VC_Occlu");
*/
	return 1;
}

stock LoadMap(mapname[])
{
    LoadIDE(mapname);
    LoadIPL(mapname);
}
enum
{
	E_NONE = 0,
	E_OBJS = 1,
	E_TOBJ,
	
	E_INST,
	E_CULL,
	E_OCCL,
	E_AUZO,
}


stock LoadIDE(dir[])
{
	new
		filename[64],
		line[256],
		t1 = GetTickCount(),
		count;
	
	new
	    ID,
	    szModelName[64],
	    szTextureName[64],
	    MeshCount,
	    Float:fDrawDistance, Float:fDrawDistance2, Float:fDrawDistance3,
	    flags,
	    TimeOn, TimeOff;
	    
	format(filename, sizeof(filename), "cmaps/VC/%s/%s.IDE", dir, dir);
	new File:fIDE = fopen(filename);

    format(filename, sizeof(filename), "./scriptfiles/cmaps/VC_Exported/%s", dir);
	dir_create(filename);

	format(filename, sizeof(filename), "cmaps/VC_Exported/%s/%s.IDE", dir, dir);
	new File:fOutput = fopen(filename, io_write);
	new stage, bool:skip;

	if(fIDE)
	{
		while(fread(fIDE, line, sizeof(line)))
		{
			if(stage == E_NONE)
			{
				if(!strcmp(line, "objs", true, 4))
				{
	                stage = E_OBJS;
	                skip = true;
				}

				if(!strcmp(line, "tobj", true, 4))
				{
				    stage = E_TOBJ;
				    skip = true;
				}
			}
			
			if(skip)
			{
				skip = false;
				fwrite(fOutput, line);
				continue;
			}
			
			switch(stage)
			{
				case E_OBJS:
				{
					if(!strcmp(line, "end", true, 3))
					{
					   	stage = E_NONE;
					    fwrite(fOutput, "end\n");
					    continue;
					}

					// Type 3
					if(!sscanf(line, "P<, >ds[64]s[64]dfffd", ID, szModelName, szTextureName, MeshCount, fDrawDistance, fDrawDistance2, fDrawDistance3, flags))
					{
		                gModels[ID] = GetNextModel();
						format(line, sizeof(line), "%d, %s, %s, %d, %.0f, %.0f, %.0f, %d\n", gModels[ID], szModelName, szTextureName, MeshCount, fDrawDistance, fDrawDistance2, fDrawDistance3, flags);
		                fwrite(fOutput, line);
		                gStart++;
		                gTotalModelsConverted++;
		                count++;
					}
					// Type 2
					else if(!sscanf(line, "P<, >ds[64]s[64]dffd", ID, szModelName, szTextureName, MeshCount, fDrawDistance, fDrawDistance2, flags))
					{
		                gModels[ID] = GetNextModel();
						format(line, sizeof(line), "%d, %s, %s, %d, %.0f, %.0f, %d\n", gModels[ID], szModelName, szTextureName, MeshCount, fDrawDistance, fDrawDistance2, flags);
		                fwrite(fOutput, line);
		                gStart++;
		                gTotalModelsConverted++;
		                count++;
					}
					// Type 1
					else if(!sscanf(line, "P<, >ds[64]s[64]dfd", ID, szModelName, szTextureName, MeshCount, fDrawDistance, flags))
					{
		                gModels[ID] = GetNextModel();
						format(line, sizeof(line), "%d, %s, %s, %d, %.0f, %d\n", gModels[ID], szModelName, szTextureName, MeshCount, fDrawDistance, flags);
		                fwrite(fOutput, line);
		                gStart++;
		                gTotalModelsConverted++;
		                count++;
					}
					// Type 4
					else if(!sscanf(line, "P<, >ds[64]s[64]fd", ID, szModelName, szTextureName, fDrawDistance, flags))
					{
					    gModels[ID] = GetNextModel();
						format(line, sizeof(line), "%d, %s, %s, %.0f, %d\n", gModels[ID], szModelName, szTextureName, (fDrawDistance > 299.0) ? fDrawDistance : 299.0, flags);
		                fwrite(fOutput, line);
		                gStart++;
		                gTotalModelsConverted++;
		                count++;
					}
					/*
					// Type 0 - for advanced info go here http://www.gtamodding.com/wiki/OBJS
					else if(!sscanf(line, "P<, >ds[64]s[64]d", ID, szModelName, szTextureName, flags))
					{
		                gModels[ID] = GetNextModel();
						format(line, sizeof(line), "%d, %s, %s, %d\n", gModels[ID], szModelName, szTextureName, flags);
		                fwrite(fOutput, line);
		                gStart++;
					}
					*/
#if defined COPY_FILES
					new input[255], output[255];
					format(input, sizeof(input), "./scriptfiles/cmaps/VC/vice/%s.dff", szModelName);
					format(output, sizeof(output), "./scriptfiles/cmaps/VC/%s/%s.dff", dir, szModelName);

					file_copy(input, output);
					
					format(input, sizeof(input), "./scriptfiles/cmaps/VC/vice/%s.txd", szTextureName);
					format(output, sizeof(output), "./scriptfiles/cmaps/VC/%s/%s.txd", dir, szTextureName);

					file_copy(input, output);
#endif
					continue;
				}
				case E_TOBJ:
				{
					if(!strcmp(line, "end", true, 3))
					{
					   	stage = E_NONE;
					    fwrite(fOutput, "end\n");
					    continue;
					}

					// Type 4 (fDrawDistance > 299.0) ? fDrawDistance : 299.0
					if(!sscanf(line, "P<, >ds[64]s[64]fddd", ID, szModelName, szTextureName, fDrawDistance, flags, TimeOn, TimeOff))
					{
		                gModels[ID] = GetNextModel();
						format(line, sizeof(line), "%d, %s, %s, %.0f, %d, %d, %d\n", gModels[ID], szModelName, szTextureName, (fDrawDistance > 299.0) ? fDrawDistance : 299.0, flags, TimeOn, TimeOff);
		                fwrite(fOutput, line);
		                gStart++;
		                gTotalModelsConverted++;
		                count++;
					}
#if defined COPY_FILES
					new input[255], output[255];
					format(input, sizeof(input), "./scriptfiles/cmaps/VC/vice/%s.dff", szModelName);
					format(output, sizeof(output), "./scriptfiles/cmaps/VC/%s/%s.dff", dir, szModelName);

					file_copy(input, output);

					format(input, sizeof(input), "./scriptfiles/cmaps/VC/vice/%s.txd", szTextureName);
					format(output, sizeof(output), "./scriptfiles/cmaps/VC/%s/%s.txd", dir, szTextureName);

					file_copy(input, output);
#endif
					continue;
				}
			}
		}
	}
	fclose(fIDE);
	fclose(fOutput);
	
	printf("-> '%s.ide :: %d models converted in %dms", dir, count, GetTickCount() - t1);
}

stock LoadIPL(dir[])
{
	new
		filename[64],
		line[256],
		stage,
		bool:skip;

	new
	    ID,
	    szModelName[64],
		interior,
	    Float:fPos[3],
		Float:fCenter[3],
	    Float:fQuat[4],
	    LOD,
	    flags;

	format(filename, sizeof(filename), "cmaps/VC/%s/%s.IPL", dir, dir);
	new File:fIPL = fopen(filename);

	format(filename, sizeof(filename), "./scriptfiles/cmaps/VC_Exported/%s", dir);
	if(!dir_exists(filename))
	{
		dir_create(filename);
	}
	format(filename, sizeof(filename), "/cmaps/VC_Exported/%s/%s.IPL", dir, dir);
	new File:fOutput = fopen(filename, io_write);

	if(fIPL)
	{
		while(fread(fIPL, line, sizeof(line)))
		{
			if(stage == E_NONE)
			{
				if(!strcmp(line, "inst", true, 4))
				{
	                stage = E_INST;
	                skip = true;
				}

				if(!strcmp(line, "cull", true, 4))
				{
				    stage = E_CULL;
				    skip = true;
				}

				if(!strcmp(line, "occl", true, 4))
				{
				    stage = E_OCCL;
				    skip = true;
				}

				if(!strcmp(line, "auzo", true, 4))
				{
				    stage = E_AUZO;
				    skip = true;
				}

			}

			if(skip)
			{
				skip = false;
				fwrite(fOutput, line);
				continue;
			}

			switch(stage)
			{
				case E_INST:
				{
					if(!strcmp(line, "end", true, 3))
					{
					   	stage = E_NONE;
					    fwrite(fOutput, "end\n");
					    continue;
					}

					if(!sscanf(line, "P<, >ds[64]dfffffffd", ID, szModelName, interior, fPos[0], fPos[1], fPos[2], fQuat[0], fQuat[1], fQuat[2], fQuat[3], LOD))
					{
		                format(line, sizeof(line), "%d, %s, %d, %f, %f, %f, %f, %f, %f, %f, %d\n", (!gModels[ID]) ? ID : gModels[ID], szModelName, interior, fPos[0] + (X_OFFSET), fPos[1] + (Y_OFFSET), fPos[2] + (Z_OFFSET), fQuat[0], fQuat[1], fQuat[2], fQuat[3], LOD);
		                fwrite(fOutput, line);
					}
				}
				case E_CULL:
				{
					if(!strcmp(line, "end", true, 3))
					{
					   	stage = E_NONE;
					    fwrite(fOutput, "end\n");
					    continue;
					}

					if(!sscanf(line, "P<, >fffdfffdfd", fCenter[0], fCenter[1], fCenter[2], ID, fPos[0], fPos[1], fPos[2], LOD, fQuat[0], flags))
					{
		                format(line, sizeof(line), "%.2f, %.2f, %.2f, %d, %.2f, %.2f, %.2f, %d, %.2f, %d\n", fCenter[0] + (X_OFFSET), fCenter[1] + (Y_OFFSET), fCenter[2] + (Z_OFFSET), ID, fPos[0], fPos[1], fPos[2], LOD, fQuat[0], flags);
		                fwrite(fOutput, line);
					}
				}
				case E_OCCL:
				{
					if(!strcmp(line, "end", true, 3))
					{
					   	stage = E_NONE;
					    fwrite(fOutput, "end\n");
					    continue;
					}

					if(!sscanf(line, "P<, >fffffffF(0.0)F(0.0)F(0.0)", fCenter[0], fCenter[1], fCenter[2], fPos[0], fPos[1], fPos[2], fQuat[0], fQuat[1], fQuat[2], fQuat[3]))
					{
		                format(line, sizeof(line), "%.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %d, %.2f, %.2f\n", fCenter[0] + (X_OFFSET), fCenter[1] + (Y_OFFSET), fCenter[2] + (Z_OFFSET), fPos[0], fPos[1], fPos[2], fQuat[0], fQuat[1], fQuat[2], fQuat[3]);
		                fwrite(fOutput, line);
					}
				}
				case E_AUZO:
				{
					if(!strcmp(line, "end", true, 3))
					{
					   	stage = E_NONE;
					    fwrite(fOutput, "end\n");
					    continue;
					}

					if(!sscanf(line, "P<, >s[64]ddffffff", szModelName, ID, LOD, fCenter[0], fCenter[1], fCenter[2], fPos[0], fPos[1], fPos[2]))
					{
		                format(line, sizeof(line), "%s, %d, %d, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f\n", szModelName, ID, LOD, fCenter[0] + (X_OFFSET), fCenter[1] + (Y_OFFSET), fCenter[2] + (Z_OFFSET), fPos[0], fPos[1], fPos[2]);
		                fwrite(fOutput, line);
					}
				}
			}
		}
	}
	fclose(fIPL);
	fclose(fOutput);
}
